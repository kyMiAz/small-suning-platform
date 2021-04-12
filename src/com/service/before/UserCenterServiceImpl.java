package com.service.before;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.UserCenterDao;
import com.util.MyUtil;

@Service("userCenterService")
@Transactional
public class UserCenterServiceImpl implements UserCenterService{
	@Autowired
	private UserCenterDao userCenterDao;
	@Override
	public String userCenter(HttpSession session, Model model) {
		model.addAttribute("myOrder", userCenterDao.myOrder(MyUtil.getUserId(session)));
		model.addAttribute("myFocus", userCenterDao.myFocus(MyUtil.getUserId(session)));
		return "before/userCenter";
	}
	@Override
	public String orderDetail(Model model, Integer ordersn) {
		model.addAttribute("myOrderDetail", userCenterDao.orderDetail(ordersn));
		return "before/userOrderDetail";
	}
	
	@Override
	public String myOrder(HttpSession session, Model model) {
		model.addAttribute("myOrder", userCenterDao.myOrder(MyUtil.getUserId(session)));
		return "before/myorder";
	}
	@Override
	public String myFocus(HttpSession session, Model model) {
		model.addAttribute("myFocus", userCenterDao.myFocus(MyUtil.getUserId(session)));
		return "before/myfocus";
	}
	@Override
	public String deleteFocus(HttpSession session, Model model,Integer id) {
		userCenterDao.deleteFoucs(id);
		return "forward:myFocus";
	}
	@Override
	public String deleteOrder(HttpSession session, Model model,Integer id) {
		userCenterDao.deleteOrder(id);
		return "forward:myOrder";
	}

}
