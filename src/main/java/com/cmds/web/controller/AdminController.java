package com.cmds.web.controller;

import com.cmds.web.model.*;
import com.cmds.web.msmapper.CmsMapper;
import com.cmds.web.mymapper.GroupMapper;
import com.cmds.web.mymapper.LevelMapper;
import com.cmds.web.mymapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@Secured("ROLE_USER")
public class AdminController {
	
    @Autowired
	private UserMapper userMapper;
    
    @Autowired
   	private GroupMapper groupMapper;
    
    @Autowired
   	private LevelMapper levelMapper;

	@Autowired
	private CmsMapper cmsMapper;

	@RequestMapping("/admin/member")
	public ModelAndView member(@ModelAttribute MultiUser multiUser,CmdsUser cmdsUser) {
		final ModelAndView modelAndView = new ModelAndView("admin/member");
		
		final List<CmdsUser> userList =  userMapper.selectAllUser();
		final List<CmdsGroup> groupList =  groupMapper.selectGroup();
		final List<CmdsLevel> levelList =  levelMapper.selectLevel();
		cmdsUser.setMain(false);
	    modelAndView.addObject("user", cmdsUser);
	    modelAndView.addObject("userList", userList);
	    modelAndView.addObject("groupList", groupList);
	    modelAndView.addObject("levelList", levelList);
	    return modelAndView;
	}
	
	@RequestMapping("/admin/modifyMember")
	public String modifyMember(@ModelAttribute MultiUser multiUser, CmdsUser cmdsUser) {
		final List<CmdsUser> list = multiUser.getUserList();
		for(int i = 0 ; i < list.size() ; i++)
		{
			userMapper.updateUserToAuth(list.get(i));
		}
		return "redirect:/index.html";
	}
	
	@RequestMapping(value = "/admin/addGroup", method = RequestMethod.POST)
	public ResponseEntity<String> addGroup(@RequestParam("groupName") String groupName , CmdsUser cmdsUser) {
		 try
		 {
			 groupMapper.insertGroup(groupName);
			 return new ResponseEntity<>("추가되었습니다.", HttpStatus.OK);
		 }
		 catch(Exception e)
		 {
			e.printStackTrace();
			 return new ResponseEntity<>("동일한 그룹명이 있습니다.", HttpStatus.BAD_REQUEST);
		 }
	}
	
	@RequestMapping(value = "/admin/deleteGroup", method = RequestMethod.POST)
	public ResponseEntity<String> deleteGroup(@RequestParam("groupID") Integer groupID , CmdsUser cmdsUser) {
		 try
		 {
			 groupMapper.deleteGroup(groupID);
			 return new ResponseEntity<>("삭제되었습니다.", HttpStatus.OK);
		 }
		 catch(Exception e)
		 {
			e.printStackTrace();
			 return new ResponseEntity<>("그룹을 사용하는 멤버가 존재합니다.", HttpStatus.BAD_REQUEST);
		 }
	}
	
	@RequestMapping(value = "/admin/addGroupInfo", method = RequestMethod.POST)
	public ResponseEntity<String> addGroupInfo(@RequestParam("groupID") Integer groupID , 
			@RequestParam("farmKey") Integer FARM_KEY ,
			@RequestParam("cmsKey") Integer CMS_KEY ,
			CmdsUser cmdsUser) {
		 try
		 {
			 CmdsGroupInfo cmdsGroupInfo = new CmdsGroupInfo();
			 cmdsGroupInfo.setGroupID(groupID);
			 cmdsGroupInfo.setCMS_KEY(CMS_KEY);
			 cmdsGroupInfo.setFARM_KEY(FARM_KEY);
			 
			 if(groupMapper.selectGroupInfoCheck(cmdsGroupInfo) == null)
			 {
				 groupMapper.insertGroupInfo(cmdsGroupInfo);
				 return new ResponseEntity<>(""+cmdsGroupInfo.getGroupInfoID(), HttpStatus.OK);
			 }
			 else
			 {
				 return new ResponseEntity<>("동일한 KEY 조합이 존재합니다.", HttpStatus.BAD_REQUEST);
			 }
		 }
		 catch(Exception e)
		 {
			e.printStackTrace();
			 return new ResponseEntity<>("실패하였습니다.", HttpStatus.BAD_REQUEST);
		 }
	}
	
	@RequestMapping(value = "/admin/deleteGroupInfo", method = RequestMethod.POST)
	public ResponseEntity<String> deleteGroupInfo(@RequestParam("groupInfoID") Integer groupInfoID , CmdsUser cmdsUser) {
		 try
		 {
			 groupMapper.deleteGroupInfo(groupInfoID);
			 return new ResponseEntity<>("삭제되었습니다.", HttpStatus.OK);
		 }
		 catch(Exception e)
		 {
			e.printStackTrace();
			 return new ResponseEntity<>("그룹을 사용하는 멤버가 존재합니다.", HttpStatus.BAD_REQUEST);
		 }
	}
	
	@RequestMapping(value = "/admin/selectGroup", method = RequestMethod.POST)
	public ResponseEntity<List<CmdsGroupInfo>> selectGroup(@RequestParam("groupID") Integer groupID , CmdsUser cmdsUser) {
		 return new ResponseEntity<>(groupMapper.selectGroupInfo(groupID), HttpStatus.OK);
	}
	
	@RequestMapping("/admin/group")
	public ModelAndView group(CmdsUser cmdsUser) {
		final ModelAndView modelAndView = new ModelAndView("admin/group");
		final List<CmdsGroup> groupList =  groupMapper.selectGroup();
		final List<Integer> farmList = cmsMapper.selectFarmKeyList();

		groupList.remove(0);
		cmdsUser.setMain(false);
		
		modelAndView.addObject("groupList", groupList);
	    modelAndView.addObject("farmList", farmList);
	    modelAndView.addObject("user", cmdsUser);
	    return modelAndView;
	}

	@RequestMapping("/admin/api/cmsKey")
	public @ResponseBody List<Integer> cmsKeyList(@RequestParam("farmKey") Integer farmKey) {
		return cmsMapper.selectCmsKeyList(farmKey);
	}
}