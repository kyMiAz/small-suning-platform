package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Buser;

@Repository("adminUserDao")
@Mapper
public interface AdminUserDao {
	public List<Buser> userInfo();
	public Buser selectBuserByemail(String name);
	public int deleteuserManager(Integer id);
	public List<Buser> selectAllBusersByPage(Map<String, Object> map);
}
