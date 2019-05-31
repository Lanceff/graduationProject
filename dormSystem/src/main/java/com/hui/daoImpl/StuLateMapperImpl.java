package com.hui.daoImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.hui.dao.StuLateMapper;
import com.hui.pojo.StuLateUtil;

public class StuLateMapperImpl implements StuLateMapper {
	@Autowired
	private SqlSessionFactory sessionFactory;
	
	@Override
	public int insertStuLate(Map<String,Object> map) {
		SqlSession session = sessionFactory.openSession();
		int result = session.insert("com.hui.dao.StuLateMapper.insertStuLate",map);
		session.close();
		return result;
	}

	@Override
	public List<StuLateUtil> selectBanAll(int banId) {
		SqlSession session = sessionFactory.openSession();
		List<StuLateUtil> result = session.selectList("com.hui.dao.StuLateMapper.selectBanAll",banId);
		session.close();
		return result;
	}

	@Override
	public List<StuLateUtil> selectByBanIdAndDate(Map<String, Object> map) {
		SqlSession session = sessionFactory.openSession();
		List<StuLateUtil> result = session.selectList("com.hui.dao.StuLateMapper.selectByBanIdAndDate",map);
		session.close();
		return result;
	}

	@Override
	public List<StuLateUtil> selectAllByStuId(Map<String, Object> map) {
		SqlSession session = sessionFactory.openSession();
		List<StuLateUtil> result = session.selectList("com.hui.dao.StuLateMapper.selectAllByStuId",map);
		session.close();
		return result;
	}

	@Override
	public List<StuLateUtil> selectByBanIdAndDateAndStuId(Map<String, Object> map) {
		SqlSession session = sessionFactory.openSession();
		List<StuLateUtil> result = session.selectList("com.hui.dao.StuLateMapper.selectByBanIdAndDateAndStuId",map);
		session.close();
		return result;
	}

	@Override
	public int selectCountStuLate(String stuId) {
		SqlSession session = sessionFactory.openSession();
		int result = session.insert("com.hui.dao.StuLateMapper.selectCountStuLate",stuId);
		session.close();
		return result;
	}

}
