package com.hui.service;

import com.hui.pojo.LoginUser;

public interface LoginUserService {
	public LoginUser login(LoginUser loginUser);
	public int insertStaffToLoginTable(String usercode);
	public int insertStuToLoginTable(String usercode);
	public int changePassword(LoginUser loginUser);
}
