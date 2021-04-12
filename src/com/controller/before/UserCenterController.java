package com.controller.before;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.before.UserCenterService;

@Controller
public class UserCenterController extends BaseBeforeController{
	@Autowired
	private UserCenterService userCenterService;
	@RequestMapping("/userCenter")
	public String userCenter(HttpSession session, Model model) {
		return userCenterService.userCenter(session, model);
	}
	@RequestMapping("/orderDetail")
	public String orderDetail(Model model, Integer ordersn) {
		return userCenterService.orderDetail(model, ordersn);
	}
	
	@RequestMapping("/myOrder")
	public String myOrder(HttpSession session, Model model) {
		return userCenterService.myOrder(session, model);
	}
	@RequestMapping("/myFocus")
	public String myFocus(HttpSession session, Model model) {
		return userCenterService.myFocus(session, model);
	}
	@RequestMapping("/deleteFocus")
	public String deleteFocus(HttpSession session, Model model,Integer id) {
		return userCenterService.deleteFocus(session, model,id);
	}
	@RequestMapping("/deleteOrder")
	public String deleteOrder(HttpSession session, Model model,Integer id) {
		return userCenterService.deleteOrder(session, model,id);
	}
	
	@RequestMapping("/toEdit")
	public String toEdit(HttpSession session, Model model) {
		return "/before/editpwd";
	}
}
