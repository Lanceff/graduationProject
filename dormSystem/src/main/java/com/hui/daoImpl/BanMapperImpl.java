package com.hui.daoImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.hui.dao.BanMapper;
import com.hui.pojo.Ban;

public class BanMapperImpl implements BanMapper {
	@Autowired
	private SqlSessionFactory sessionFactory;
	//添加楼栋
	@Override
	public void insert(Ban ban) {
		SqlSession session = sessionFactory.openSession();
		session.insert("com.hui.dao.BanMapper.addBan", ban);
		session.close();
	}
	
	//根据输入的楼栋号查询是否存在这个楼栋
	@Override
	public int selectCountById(String banId) {
		SqlSession session = sessionFactory.openSession();
		int result = session.selectOne("com.hui.dao.BanMapper.selectCountById", banId);
		session.close();
		return result;
	}
	
	//获取所有的楼栋信息
	@Override
	public List<Ban> getAllBan() {
		SqlSession session = sessionFactory.openSession();
		List<Ban> result = session.selectList("com.hui.dao.BanMapper.getAllBan");
		session.close();
		return result;
	}
	
	//获取输入的楼栋号的楼栋信息
	@Override
	public Ban getOneBanById(String banId) {
		SqlSession session = sessionFactory.openSession();
		Ban result = session.selectOne("com.hui.dao.BanMapper.getOneBanById", banId);
		session.close();
		return result;
	}

	//删除某个楼栋信息
	@Override
	public int deleteBanById(String banId) {
		SqlSession session = sessionFactory.openSession();
		int result = session.delete("com.hui.dao.BanMapper.deleteBanById", banId);
		session.close();
		return result;
	}

	@Override
	public int isExitBan(String banId) {
		SqlSession session = sessionFactory.openSession();
		int result = session.selectOne("com.hui.dao.BanMapper.isExitBan", banId);
		session.close();
		return result;
	}

	@Override
	public int updateBan(Ban ban) {
		SqlSession session = sessionFactory.openSession();
		int result = session.update("com.hui.dao.BanMapper.updateBan", ban);
		session.close();
		return result;
	}

	@Override
	public List<Ban> selectStaffIdIsNull() {
		SqlSession session = sessionFactory.openSession();
		List<Ban> result = session.selectList("com.hui.dao.BanMapper.selectStaffIdIsNull");
		session.close();
		return result;
	}

	@Override
	public int updateBanStaffInfo(Map paramMap) {
		SqlSession session = sessionFactory.openSession();
		int result = session.update("com.hui.dao.BanMapper.updateBanStaffInfo",paramMap);
		session.close();
		return result;
	}

	@Override
	public List<String> selectBanIdList() {
		SqlSession session = sessionFactory.openSession();
		List<String> result = session.selectList("com.hui.dao.BanMapper.selectBanIdList");
		session.close();
		return result;
	}

	@Override
	public String getBanIdByStaffId(String banStaffId) {
		SqlSession session = sessionFactory.openSession();
		String result = session.selectOne("com.hui.dao.BanMapper.getBanIdByStaffId", banStaffId);
		session.close();
		return result;
	}

	@Override
	public int banStaffIsExit(String banStaffId) {
		SqlSession session = sessionFactory.openSession();
		int result = session.selectOne("com.hui.dao.BanMapper.banStaffIsExit", banStaffId);
		session.close();
		return result;
	}

}
