package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Goods;
import com.po.GoodsType;
@Repository("adminTypeDao")
@Mapper
public interface AdminTypeDao {
	public List<GoodsType> selectGoodsType();
	public int addType(String typename);
	public int deleteType(Integer id);
	public List<Goods> selectGoodsByType(Integer id);
	public List<GoodsType> selectAllGoodsTypesByPage(Map<String, Object> map);
}
