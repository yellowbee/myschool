package com.aidu.myschool.web.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aidu.myschool.dao.PasswordResetDao;
import com.aidu.myschool.dao.UserDao;
import com.aidu.myschool.domain.PasswordReset;
import com.aidu.myschool.domain.User;
import com.aidu.myschool.security.PasswordHash;
import com.aidu.myschool.web.domain.ajaxrequest.PasswordResetInfo;
import com.aidu.myschool.web.domain.ajaxrequest.PasswordResetRequest;
import com.aidu.myschool.web.domain.ajaxresponse.CommonResponse;
import com.aidu.myschool.web.domain.ajaxresponse.PasswordResetReuqestResponse;
import com.aidu.myschool.web.formbean.LoginForm;
import com.aidu.myschool.web.formbean.SignUpForm;

@Controller
public class LoginController {
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	
	@Autowired
	@Qualifier("passwordResetDao")
	private PasswordResetDao passwordResetDao;
	
	private final static long ONE_HOUR_IN_MILLISECS = 3600000;
	
	@RequestMapping(value="/home", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView model = new ModelAndView("home");
		//model.addObject("signUpForm", new SignUpForm());
		model.addObject("loginForm", new LoginForm());
		model.addObject("visibility", "hidden");
		return model;
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		if (session != null) session.invalidate();
		return new ModelAndView("redirect:home");
	}
	
	@RequestMapping(value="/signup", method = RequestMethod.GET)
	public ModelAndView signUpPage() {
		ModelAndView model = new ModelAndView("signup");
		return model;
	}
	
	@RequestMapping(value = "/signUpProcess", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody CommonResponse signUpProcess(@RequestBody SignUpForm signUpForm) throws IOException {

		System.out.println(signUpForm.getEmail());
		System.out.println(signUpForm.getPassword());
		
		List<User> userList = userDao.getUserByEmail(signUpForm.getEmail());
		if (userList != null && userList.size() > 0) {
			return new CommonResponse("FAILURE", "电子邮件地址已被注册， 请重新填写");
		}
		
		User user = new User();
		user.setNickName(signUpForm.getNickName());
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
        user.setPhone(signUpForm.getPhone());
        user.setSex(signUpForm.getSex());
        
        userDao.insert(user);
        
        return new CommonResponse("SUCCESS", "");     
	}
	
	
	@RequestMapping(value="/getPwResetReqPg", method = RequestMethod.GET)
	public ModelAndView getPasswordResetRequestPage() {
		ModelAndView model = new ModelAndView("pw-reset-req");
		return model;
	}
	
	@RequestMapping(value = "/submitPwResetReq", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody PasswordResetReuqestResponse processPasswordResetRequest(HttpServletRequest request, HttpServletResponse response,
			@RequestBody PasswordResetRequest pwResetReq) throws IOException {
		
		List<User> userList = userDao.getUserByEmail(pwResetReq.getEmail());
		if (userList != null && userList.size() > 0) {
			//System.out.println(UUID.randomUUID());
			PasswordReset pr = new PasswordReset();
			String uuidStr = UUID.randomUUID().toString();
			pr.setUuid(uuidStr);
			pr.setTimestamp(new Timestamp(System.currentTimeMillis()));
			pr.setEmail(userList.get(0).getEmail());
			passwordResetDao.insert(pr);
			return new PasswordResetReuqestResponse("SUCCESS", "", uuidStr);
		}
		else {
			return new PasswordResetReuqestResponse("FAILURE", "", "");
		}
	}
	
	@RequestMapping(value="/passwordResetPg", method = RequestMethod.GET)
	public ModelAndView getPasswordResetPage(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("uuid:" + request.getParameter("uuid"));
		List<PasswordReset> prList = passwordResetDao.getResetRequestByUuid(request.getParameter("uuid"));
		if (prList != null && prList.size() > 0) {
			long currentTime = System.currentTimeMillis();
			long reqTime = prList.get(0).getTimestamp().getTime();
			if ((currentTime - reqTime) < ONE_HOUR_IN_MILLISECS) {
				ModelAndView model = new ModelAndView("pw-reset");
				return model;
			}
		}
		
		return null;
	}
	
	/*@RequestMapping(value = "/submitPwResetInfo", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody CommonResponse processPasswordResetRequest(HttpServletRequest request, HttpServletResponse response,
			@RequestBody PasswordResetInfo pwResetInfo) throws IOException {
		
		System.out.println("New password:" + pwResetInfo.getNewPassword());
		List<PasswordReset> prList = passwordResetDao.getResetRequestByUuid(request.getParameter(uuid));
		if (prList != null && prList.size() > 0) {
			long currentTime = System.currentTimeMillis();
			long reqTime = prList.get(0).getTimestamp().getTime();
			if ((currentTime - reqTime) < ONE_HOUR_IN_MILLISECS) {
				List<User> userList = userDao.getUserByEmail(prList.get(0).getEmail());
				if (userList != null && userList.size() > 0) {
					try {
						userList.get(0).setPasswordHash(PasswordHash.createHash(pwResetInfo.getNewPassword()));
					} catch (NoSuchAlgorithmException e) {
						e.printStackTrace();
					} catch (InvalidKeySpecException e) {
						e.printStackTrace();
					}
				}
			}
			else {
				return new CommonResponse("FAILURE", "Request expired!");
			}
		}
		else {
			return new CommonResponse("FAILURE", "Invalid request URL!");
		}
		
		return new CommonResponse("SUCCESS", "");
		
	}*/
	
	@RequestMapping(value="/authentication", method = RequestMethod.POST)
	public ModelAndView authenticate(@ModelAttribute("loginForm") LoginForm loginForm, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(loginForm.getUsername());
		System.out.println(loginForm.getPassword());
		
		ModelAndView mav = null;
		List<User> results = userDao.getUserByEmail(loginForm.getUsername());
		if (results.size() == 0) {
			mav = new ModelAndView("home");
			mav.addObject("signUpForm", new SignUpForm());
			mav.addObject("loginForm", new LoginForm());
			mav.addObject("visibility", "visible");
			return mav;
		}
		
		try {
			if (PasswordHash.validatePassword(loginForm.getPassword(), results.get(0).getPasswordHash())) {
				HttpSession session = request.getSession();
				session.setAttribute("user", results.get(0));
				mav = new ModelAndView("find_my_college");
				mav.addObject("user", results.get(0));
				mav.addObject("unlogged", "display-none");
				mav.addObject("logged", "display-inline");
			}
			else {
				mav = new ModelAndView("home");
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
