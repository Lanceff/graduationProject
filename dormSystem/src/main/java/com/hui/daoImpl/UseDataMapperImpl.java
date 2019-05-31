package com.hui.daoImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.hui.dao.UseDataMapper;
import com.hui.pojo.UseData;
import com.hui.pojo.UseDataKey;

public class UseDataMapperImpl implements UseDataMapper {
	
	@Autowired
	private SqlSessionFactory sessionFactory;
	
	
	@Override
	public List<UseData> selectAllYearByDorm(Map<String, String> map) {
		SqlSession session = sessionFactory.openSession();
		List<UseData> result = session.selectList("com.hui.dao.UseDataMapper.selectAllYearByDorm",map);
		session.close();
		return result;
	}

	@Override
	public UseData selectMonthByDorm(UseDataKey useDataKey) {
		SqlSession session = sessionFactory.openSession();
		UseData result = session.selectOne("com.hui.dao.UseDataMapper.selectMonthByDorm",useDataKey);
		session.close();
		return result;
	}

}
