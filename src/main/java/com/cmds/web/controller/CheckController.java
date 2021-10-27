package com.cmds.web.controller;

import com.cmds.web.model.CmdsUser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Secured("ROLE_USER")
public class CheckController {

    @RequestMapping("/page/onh-check")
	public ModelAndView onhCheck(CmdsUser cmdsUser) {
         final ModelAndView modelAndView = new ModelAndView("page/onh-check");
         cmdsUser.setMain(false);
         modelAndView.addObject("user", cmdsUser);
         return modelAndView;
	}
    
    @RequestMapping(value = "/page/getCheckList", method = RequestMethod.POST)
    public ResponseEntity<boolean[]> getCheckList(CmdsUser cmdsUser) {
        return new ResponseEntity<>(cmdsUser.getCheckList(),HttpStatus.OK);
    }
    
    @RequestMapping(value = "/page/getPart", method = RequestMethod.POST)
    public ResponseEntity<Integer> getPart(CmdsUser cmdsUser) {
        return new ResponseEntity<>(cmdsUser.getPart(),HttpStatus.OK);
    }
    
    @RequestMapping(value = "/page/setPart", method = RequestMethod.POST)
    public ResponseEntity<String> setPart(@RequestParam("part") int partNumber,CmdsUser cmdsUser) {
    	cmdsUser.setPart(partNumber);
        return new ResponseEntity<>("SUCCESS",HttpStatus.OK);
    }
    
    @RequestMapping(value = "/page/checkItemTrue", method = RequestMethod.POST)
    public ResponseEntity<String> checkItemTrue(@RequestParam("check") int check,CmdsUser cmdsUser) {
    	cmdsUser.setCheck(check,true);
        return new ResponseEntity<>("SUCCESS",HttpStatus.OK);
    }
    @RequestMapping(value = "/page/checkItemFalse", method = RequestMethod.POST)
    public ResponseEntity<String> checkItemFalse(@RequestParam("check") int check,CmdsUser cmdsUser) {
    	cmdsUser.setCheck(check,false);
        return new ResponseEntity<>("SUCCESS",HttpStatus.OK);
    }
}
