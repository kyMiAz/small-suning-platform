package com.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.AdminTypeDao;
import com.po.GoodsType;
@Service("adminTypeService")
@Transactional
public class AdminTypeServiceImpl implements AdminTypeService{
	@Autowired
	private AdminTypeDao adminTypeDao;

	@Override
	public String toAddType(Model model,Integer pageCur) {
		model.addAttribute("allTypes", adminTypeDao.selectGoodsType());
		//
		List<GoodsType> allGoodsTypes = adminTypeDao.selectGoodsType();
		int temp = allGoodsTypes.size();
		model.addAttribute("totalCount", temp);
		int totalPage = 0;
		if (temp == 0) {
			totalPage = 0;//总页数
		} else {
			//返回大于或者等于指定表达式的最小整数
			totalPage = (int) Math.ceil((double) temp / 10);
		}
		if (pageCur == null) {
			pageCur = 1;
		}
		if ((pageCur - 1) * 10 > temp) {
			pageCur = pageCur - 1;
		}
		//分页查询
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIndex", (pageCur - 1) * 10);//起始位置
		map.put("perPageSize", 10);//每页10个
		allGoodsTypes = adminTypeDao.selectAllGoodsTypesByPage(map);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageCur", pageCur);
		//
		return "admin/addType";
	}

	@Override
	public String addType(String typename, Model model, HttpSession session) {
		adminTypeDao.addType(typename);
		//添加商品与修改商品页面使用
		session.setAttribute("goodsType", adminTypeDao.selectGoodsType());
		return "forward:/adminType/toAddType";
	}

	@Override
	public String toDeleteType(Model model,Integer pageCur) {
		model.addAttribute("allTypes", adminTypeDao.selectGoodsType());
		//
		List<GoodsType> allGoodsTypes = adminTypeDao.selectGoodsType();
		int temp = allGoodsTypes.size();
		model.addAttribute("totalCount", temp);
		int totalPage = 0;
		if (temp == 0) {
			totalPage = 0;//总页数
		} else {
			//返回大于或者等于指定表达式的最小整数
			totalPage = (int) Math.ceil((double) temp / 10);
		}
		if (pageCur == null) {
			pageCur = 1;
		}
		if ((pageCur - 1) * 10 > temp) {
			pageCur = pageCur - 1;
		}
		//分页查询
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIndex", (pageCur - 1) * 10);//起始位置
		map.put("perPageSize", 10);//每页10个
		allGoodsTypes = adminTypeDao.selectAllGoodsTypesByPage(map);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageCur", pageCur);
		//
		return "admin/deleteType";
	}

	@Override
	public String deleteType(Integer id, Model model) {
		//类型有关联
		if(adminTypeDao.selectGoodsByType(id).size() > 0) {
			model.addAttribute("msg", "类型有关联，不允许删除！");
			return "forward:/adminType/toDeleteType";
		}
		if(adminTypeDao.deleteType(id) > 0) 
			model.addAttribute("msg", "类型成功删除！");
		//回到删除页面
		return "forward:/adminType/toDeleteType";
	}
	
}
