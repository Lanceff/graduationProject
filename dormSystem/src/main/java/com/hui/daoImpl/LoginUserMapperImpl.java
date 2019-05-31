package com.hui.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.hui.dao.LoginUserMapper;
import com.hui.pojo.LoginUser;

public class LoginUserMapperImpl implements LoginUserMapper {
	@Autowired
	private SqlSessionFactory sessionFactory;
	
	public LoginUser login(LoginUser loginUser) {
		SqlSession session = sessionFactory.openSession();
		LoginUser result = session.selectOne("com.hui.dao.LoginUserMapper.login",loginUser);
		session.close();
		return result;
	}

	@Override
	public int insertStaffToLoginTable(String usercode) {
		SqlSession session = sessionFactory.openSession();
		int result = session.insert("com.hui.dao.LoginUserMapper.insertStaffToLoginTable",usercode);
		session.close();
		return result;
	}

	@Override
	public int insertStuToLoginTable(String usercode) {
		SqlSession session = sessionFactory.openSession();
		int result = session.insert("com.hui.dao.LoginUserMapper.insertStuToLoginTable",usercode);
		session.close();
		return result;
	}

	@Override
	public int deleteByCode(String usercode) {
		SqlSession session = sessionFactory.openSession();
		int result = session.delete("com.hui.dao.LoginUserMapper.deleteByCode",usercode);
		session.close();
		return result;
	}

	@Override
	public int changePassword(LoginUser loginUser) {
		SqlSession session = sessionFactory.openSession();
		int result = session.update("com.hui.dao.LoginUserMapper.changePassword",loginUser);
		session.close();
		return result;
	}

	
}
