package com.aidu.myschool.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.aidu.myschool.dao.UserDao;
import com.aidu.myschool.domain.User;
import com.aidu.myschool.web.formbean.SignUpForm;

@Controller
public class LoginController {
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView model = new ModelAndView("login");
		model.addObject("signUpForm", new SignUpForm());
		return model;
	}
	
	@RequestMapping(value="/signUp", method = RequestMethod.POST)
	@Transactional
	public ModelAndView processSignUp(@ModelAttribute("signUpForm") SignUpForm signUpForm) {
         
        // implement your own registration logic here...
         
        // for testing purpose:
        System.out.println("username: " + signUpForm.getEmail());
        System.out.println("username: " + signUpForm.getPassword());

        User user = new User();
        user.setEmail(signUpForm.getEmail());
        user.setPassword_hash(signUpForm.getPassword());
        user.setFirstName(signUpForm.getFirstName());
        user.setLastName(signUpForm.getLastName());
        
        userDao.insert(user);
       
       /* ModelAndView model = new ModelAndView("login");
        model.addObject("signUpForm", signUpForm);
        return model;*/
        return null;
    }
}
