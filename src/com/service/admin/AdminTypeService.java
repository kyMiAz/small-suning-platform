package com.service.admin;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface AdminTypeService {
	public String toAddType(Model model,Integer pageCur);
	public String addType(String typename,Model model,HttpSession session);
	public String toDeleteType(Model model,Integer pageCur);
	public String deleteType(Integer id,Model model);
}
