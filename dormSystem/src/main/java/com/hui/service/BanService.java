package com.hui.service;

import java.util.List;
import java.util.Map;

import com.hui.pojo.Ban;

public interface BanService {
	public void insert(Ban ban); 
	public int selectCountById(String banId);
	public List<Ban> getAllBan();
	public Ban getOneBanById(String banId);
	public int isExitBan(String banId);
	public int delBanById(String banId);
	public int updateBan(Ban ban);
	public List<Ban> selectStaffIdIsNull();
	public int updateBanStaffInfo(Map paramMap);
	public List<String> selectBanIdList();
	
	public String getBanIdByStaffId(String banStaffId);
	public int banStaffIsExit(String banStaffId);
}
