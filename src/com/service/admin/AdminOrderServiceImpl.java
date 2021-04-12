package com.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.AdminOrderDao;

@Service("adminOrderService")
@Transactional
public class AdminOrderServiceImpl implements AdminOrderService{
	@Autowired
	private AdminOrderDao adminOrderDao;
	@Override
	public String orderInfo(Model model,Integer pageCur) {
		List<Map<String,Object>> list = adminOrderDao.orderInfo();
		model.addAttribute("orderList", list);
		//
		List<Map<String,Object>> allOrders = adminOrderDao.orderInfo();
		int temp = allOrders.size();
		model.addAttribute("totalCount", temp);
		int totalPage = 0;
		if (temp == 0) {
			totalPage = 0;//总页数
		} else {
			//返回大于或者等于指定表达式的最小整数
			totalPage = (int) Math.ceil((double) temp / 7);
		}
		if (pageCur == null) {
			pageCur = 1;
		}
		if ((pageCur - 1) * 7 > temp) {
			pageCur = pageCur - 1;
		}
		//分页查询
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIndex", (pageCur - 1) * 7);//起始位置
		map.put("perPageSize", 7);//每页10个
		allOrders = adminOrderDao.selectAllOrdersByPage(map);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageCur", pageCur);
		//
		return "admin/orderManager";
	}
	@Override
	public String deleteorderManager(Integer id) {
		//先删除明细
		adminOrderDao.deleteOrderDetail(id);
		//再删除订单基础
		adminOrderDao.deleteOrderBase(id);
		return "forward:/adminOrder/orderInfo";
	}

}
