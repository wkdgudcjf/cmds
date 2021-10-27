package com.cmds.web.controller;

import com.cmds.web.model.CmdsGroupInfo;
import com.cmds.web.model.CmdsUser;
import com.cmds.web.model.DriveTrainVibration;
import com.cmds.web.model.Report;
import com.cmds.web.model.WindTurbineGenerator;
import com.cmds.web.msmapper.CmdsMapper;
import com.cmds.web.msmapper.CmsMapper;
import com.cmds.web.msmapper.IWindMapper;
import com.cmds.web.mymapper.GroupMapper;
import com.cmds.web.mymapper.ReportMapper;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@Secured("ROLE_USER")
public class ComponentController {

    @Autowired
    private ReportMapper reportMapper;
    
    @Autowired
   	private GroupMapper groupMapper;
    
	@Autowired
	private CmsMapper cmsMapper;

	@Autowired
	private IWindMapper iWindMapper;

    @Value("${assets.base.path}")
    private String assetsBasePath;

    @RequestMapping("/page/onh-history")
    public ModelAndView onhHistory(CmdsUser cmdsUser) {
        final ModelAndView modelAndView = new ModelAndView("page/onh-history");
        
        List<CmdsGroupInfo> groupInfoList = groupMapper.selectGroupInfo(cmdsUser.getGroupID());
        
        int lastID = 0;
        List<Report> reportList;
        if(groupInfoList.size() == 0)
        {
        	reportList = new ArrayList<Report>();
        }
        else
        {
        	reportList = reportMapper.selectReport(groupInfoList);
        	if(reportList.size() > 0)
        	{
            	lastID = reportList.get(reportList.size()-1).getId();
        	}
        }

    	cmdsUser.setMain(false);
    	modelAndView.addObject("lastID", lastID);
        modelAndView.addObject("user", cmdsUser);
        modelAndView.addObject("reportList", reportList);
        return modelAndView;
    }
    
    @RequestMapping(value = "/page/loadData", method = RequestMethod.POST)
	public ResponseEntity<List<Report>> selectGroup(@RequestParam("lastID") Integer lastID , CmdsUser cmdsUser) {
    	
        List<CmdsGroupInfo> groupInfoList = groupMapper.selectGroupInfo(cmdsUser.getGroupID());
        
        HashMap hm = new HashMap();
        hm.put("lastID", lastID) ;
        hm.put("groupInfoList", groupInfoList);
        
        List<Report> reportList = reportMapper.selectReportLast(hm);
		 return new ResponseEntity<>(reportList, HttpStatus.OK);
	}
    @RequestMapping("/page/component")
    public ModelAndView component(@ModelAttribute("report") Report report,CmdsUser cmdsUser,
    		@RequestParam("farmKey") Integer farmKey,
			@RequestParam("cmsKey") Integer cmsKey) {
    	 final ModelAndView modelAndView = new ModelAndView("page/component");
    	 
    	final Integer ioDevice = cmsMapper.selectTurbineIoDevice(farmKey, cmsKey);
    	
 		String unitName = iWindMapper.selectUnitName(ioDevice);
    	cmdsUser.setMain(true);
 		cmdsUser.setFarmKey(farmKey);
 		cmdsUser.setCmsKey(cmsKey);
 		 
  		modelAndView.addObject("unitName", unitName);
  		modelAndView.addObject("user", cmdsUser);
        return modelAndView;
    }

    @PostMapping("/page/report")
    public String report(
            @ModelAttribute("report") @Valid Report report,
            BindingResult bindingResult,
            @RequestParam("imageFile") MultipartFile imageFile,
            CmdsUser cmdsUser
    ) throws IOException {
        if (imageFile == null || imageFile.getSize() == 0) {
            bindingResult.rejectValue("imageTarget", "이미지를 업로드해주세요.");
            return "page/component";
        }

        // 파일 이동
        final String filename = UUID.randomUUID().toString() + "." + FilenameUtils.getExtension(imageFile.getOriginalFilename());
        final File dsetFile = new File(assetsBasePath, filename);
        FileUtils.forceMkdirParent(dsetFile);
        imageFile.transferTo(dsetFile);

        // DB 저장
        report.setUserID(cmdsUser.getUserID());
        report.setImageTarget(filename);
        reportMapper.insertReport(report);

        return "redirect:/page/component.html?farmKey=" + report.getFarmKey() + "&cmsKey=" + report.getCmsKey();
    }
}
