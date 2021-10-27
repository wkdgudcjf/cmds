package com.cmds.web.controller;

import com.cmds.web.model.CmdsUser;
import com.cmds.web.mymapper.UserMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.PrintWriter;

@Controller
public class LoginController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserMapper userMapper;
    
    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    
    @GetMapping("/login")
    public ModelAndView login() {
		final ModelAndView modelAndView	= new ModelAndView("login");
    	modelAndView.addObject("msg", "");
        return modelAndView;
    }
    @GetMapping("/loginFail")
    public ModelAndView loginFail() {
		final ModelAndView modelAndView	= new ModelAndView("login");
		modelAndView.addObject("msg", "이메일이나 비밀번호를 확인하세요!");
        return modelAndView;
    }

    @GetMapping("/register")
    public String registerForm(@ModelAttribute("user") CmdsUser cmdsUser) {
        return "register";
    }
	
	 @RequestMapping(value = "/modifyPassword", method = RequestMethod.POST)
	 public ResponseEntity<String> modifyPassword(@RequestParam("password") String password,CmdsUser cmdsUser){
		 cmdsUser.setPassword(passwordEncoder.encode(password));
		 userMapper.updateUser(cmdsUser);
	    return new ResponseEntity<>("수정되었습니다.", HttpStatus.OK);
	}
	 
    @PostMapping("/register")
    public String registerUser(
            HttpServletResponse response,
            @ModelAttribute("user") @Valid CmdsUser cmdsUser,
            BindingResult bindingResult
    ) throws Exception {
        if (bindingResult.hasErrors()) {
            return "register";
        }
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
        	cmdsUser.setPassword(passwordEncoder.encode(cmdsUser.getPassword()));
        	userMapper.insertUser(cmdsUser);
            out.println("<script>alert('가입되었습니다.'); location.href = '/login';</script>");
            out.flush();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            out.println("<script>alert('중복된 E-Mail이 존재합니다.'); location.href = '/register';</script>");
            out.flush();
        }
        return null;
    }
}
