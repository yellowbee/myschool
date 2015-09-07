package com.aidu.myschool.web.controller;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.aidu.myschool.dao.UserDao;
import com.aidu.myschool.domain.User;
import com.aidu.myschool.security.PasswordHash;
import com.aidu.myschool.web.formbean.LoginForm;
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
		model.addObject("loginForm", new LoginForm());
		model.addObject("visibility", "hidden");
		return model;
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		if (session != null) session.invalidate();
		return new ModelAndView("redirect:login");
	}
	
	@RequestMapping(value="/signUp", method = RequestMethod.POST)
	public ModelAndView processSignUp(@ModelAttribute("signUpForm") SignUpForm signUpForm) {
         
        // implement your own registration logic here...
         
        // for testing purpose:
        System.out.println("username: " + signUpForm.getEmail());
        System.out.println("username: " + signUpForm.getPassword());

        User user = new User();
        user.setEmail(signUpForm.getEmail());
        
        // convert the password in plain text to 48-bit salted hash code
        try {
			user.setPasswordHash(PasswordHash.createHash(signUpForm.getPassword()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		}
        user.setFirstName(signUpForm.getFirstName());
        user.setLastName(signUpForm.getLastName());
        
        userDao.insert(user);
       
       /* ModelAndView model = new ModelAndView("login");
        model.addObject("signUpForm", signUpForm);
        return model;*/
        return null;
    }
	
	@RequestMapping(value="/authentication", method = RequestMethod.POST)
	public ModelAndView authenticate(@ModelAttribute("loginForm") LoginForm loginForm, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(loginForm.getUsername());
		System.out.println(loginForm.getPassword());
		
		ModelAndView mav = null;
		List<User> results = userDao.getUserByEmail(loginForm.getUsername());
		if (results.size() == 0) {
			mav = new ModelAndView("login");
			mav.addObject("signUpForm", new SignUpForm());
			mav.addObject("loginForm", new LoginForm());
			mav.addObject("visibility", "visible");
			return mav;
		}
		
		try {
			if (PasswordHash.validatePassword(loginForm.getPassword(), results.get(0).getPasswordHash())) {
				HttpSession session = request.getSession();
				session.setAttribute("user", results.get(0));
				mav = new ModelAndView("home");
				mav.addObject("user", results.get(0));
			}
			else {
				mav = new ModelAndView("login");
				mav.addObject("signUpForm", new SignUpForm());
				mav.addObject("loginForm", new LoginForm());
				mav.addObject("visibility", "visible");
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		}
		
		return mav;
	}
}
