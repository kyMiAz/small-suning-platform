package com.service.admin;

import org.springframework.ui.Model;

public interface AdminOrderService {
	public String orderInfo(Model model,Integer pageCur);
	public String deleteorderManager(Integer id);
}
