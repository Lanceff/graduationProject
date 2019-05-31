package com.hui.daoImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.hui.dao.BanVisitMapper;
import com.hui.pojo.BanVisit;
import com.hui.pojo.BanVisitUtil;

public class BanVisitMapperImpl implements BanVisitMapper {
	@Autowired
	private SqlSessionFactory sessionFactory;
	
	@Override
	public int insertBanVist(Map<String, String> map) {
		SqlSession session = sessionFactory.openSession();
		int result = session.selectOne("com.hui.dao.BanVisitMapper.insertBanVist",map);
		session.close();
		return result;
	}

	@Override
	public List<BanVisit> outTimeNullList(String banId) {
		SqlSession session = sessionFactory.openSession();
		List<BanVisit> result = session.selectList("com.hui.dao.BanVisitMapper.outTimeNullList",banId);
		session.close();
		return result;
	}

	@Override
	public int visitorLeavelOutTime(Integer bvId) {
		SqlSession session = sessionFactory.openSession();
		int result = session.selectOne("com.hui.dao.BanVisitMapper.visitorLeavelOutTime",bvId);
		session.close();
		return result;
	}

	@Override
	public List<BanVisit> selectAllVisitInfo(String banId) {
		SqlSession session = sessionFactory.openSession();
		List<BanVisit> result = session.selectList("com.hui.dao.BanVisitMapper.selectAllVisitInfo",banId);
		session.close();
		return result;
	}

	@Override
	public List<BanVisitUtil> selectByDate(Map<String, String> map) {
		SqlSession session = sessionFactory.openSession();
		List<BanVisitUtil> result = session.selectList("com.hui.dao.BanVisitMapper.selectByDate",map);
		session.close();
		return result;
	}

}
