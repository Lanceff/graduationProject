package com.hui.dao;

import com.hui.pojo.LoginUser;

public interface LoginUserMapper {
	public LoginUser login(LoginUser loginUser);
	public int insertStaffToLoginTable(String usercode);
	public int insertStuToLoginTable(String usercode);
	public int deleteByCode(String usercode);
	public int changePassword(LoginUser loginUser);
}