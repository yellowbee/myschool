package com.aidu.myschool.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.aidu.myschool.web.formbean.SignUpForm;

@Controller
public class LoginController {
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView model = new ModelAndView("login");
		model.addObject("signUpForm", new SignUpForm());
		return model;
	}
	
	@RequestMapping(value="/signUp", method = RequestMethod.POST)
	public ModelAndView processSignUp(@ModelAttribute("signUpForm") SignUpForm signUpForm) {
         
        // implement your own registration logic here...
         
        // for testing purpose:
        System.out.println("username: " + signUpForm.getEmail());
        System.out.println("username: " + signUpForm.getPassword());
        
       /* ModelAndView model = new ModelAndView("login");
        model.addObject("signUpForm", signUpForm);
        return model;*/
        return null;
    }
}
