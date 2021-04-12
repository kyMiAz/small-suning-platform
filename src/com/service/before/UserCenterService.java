package com.service.before;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface UserCenterService {
	public String userCenter(HttpSession session, Model model);
	public String orderDetail(Model model, Integer ordersn);
	
	public String myOrder(HttpSession session, Model model);
	public String myFocus(HttpSession session, Model model);
	public String deleteFocus(HttpSession session, Model model,Integer id);
	public String deleteOrder(HttpSession session, Model model,Integer id);
}
