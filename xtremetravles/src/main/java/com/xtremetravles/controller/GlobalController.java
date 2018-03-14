package com.xtremetravles.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.xtremetravles.model.UserModel;
import com.xtremetravlesbackend.dao.UserDao;
import com.xtremetravlesbackend.dto.User;


@ControllerAdvice
public class GlobalController {

	
	@Autowired
	private  HttpSession session;
	
	@Autowired
	private UserDao userDao;
	
	private User user = null;
	private UserModel userModel=null;
	
//	@ModelAttribute("userModel")
//	public UserModel getUserModel(){
//		
//		if (session.getAttribute("userModel")==null) {
//			
//			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//			
//			if (!authentication.getPrincipal().equals("anonymousUser")) {
//				
//			user =	userDao.getUserByEmail(authentication.getName());
//			
//			if (user!=null) {
//				
//				userModel = new UserModel();
//				userModel.setId(user.getId());
//				userModel.setFullName(user.getFirstName()+' '+user.getLastName());
//				userModel.setRole(user.getRole());
//				
//				session.setAttribute("userModel", userModel);
//				return userModel;
//			}
//			}
//		}
//		
//		return (UserModel) session.getAttribute("userModel");
//	}
	
}
