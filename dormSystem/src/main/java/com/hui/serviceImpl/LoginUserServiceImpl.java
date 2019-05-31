package com.hui.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hui.dao.LoginUserMapper;
import com.hui.pojo.LoginUser;
import com.hui.service.LoginUserService;
@Service(value="loginUserService")
public class LoginUserServiceImpl implements LoginUserService {
	@Autowired
	private LoginUserMapper loginUserMapper;
	
	public LoginUser login(LoginUser loginUser) {
		return loginUserMapper.login(loginUser);
	}

	@Override
	public int insertStaffToLoginTable(String usercode) {
		return loginUserMapper.insertStaffToLoginTable(usercode);
	}

	@Override
	public int insertStuToLoginTable(String usercode) {
		return loginUserMapper.insertStuToLoginTable(usercode);
	}

	@Override
	public int changePassword(LoginUser loginUser) {
		return loginUserMapper.changePassword(loginUser);
	}

}
