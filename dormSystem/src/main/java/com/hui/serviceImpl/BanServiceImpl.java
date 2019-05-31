package com.hui.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hui.dao.BanMapper;
import com.hui.pojo.Ban;
import com.hui.service.BanService;

@Service(value="banService")
public class BanServiceImpl implements BanService {
	@Autowired 
	private BanMapper banMapper;
	
	@Override
	public void insert(Ban ban) {
		banMapper.insert(ban);
	}

	@Override
	public int selectCountById(String banId) {
		return banMapper.selectCountById(banId);
	}

	@Override
	public List<Ban> getAllBan() {
		return banMapper.getAllBan();
	}

	@Override
	public Ban getOneBanById(String banId) {
		return banMapper.getOneBanById(banId);
	}

	@Override
	public int delBanById(String banId) {
		return banMapper.deleteBanById(banId);
	}

	@Override
	public int isExitBan(String banId) {
		return banMapper.isExitBan(banId);
	}

	@Override
	public int updateBan(Ban ban) {
		return banMapper.updateBan(ban);
	}

	@Override
	public List<Ban> selectStaffIdIsNull() {
		return banMapper.selectStaffIdIsNull();
	}

	@Override
	public int updateBanStaffInfo(Map paramMap) {
		return banMapper.updateBanStaffInfo(paramMap);
	}

	@Override
	public List<String> selectBanIdList() {
		return banMapper.selectBanIdList();
	}

	@Override
	public String getBanIdByStaffId(String banStaffId) {
		return banMapper.getBanIdByStaffId(banStaffId);
	}

	@Override
	public int banStaffIsExit(String banStaffId) {
		return banMapper.banStaffIsExit(banStaffId);
	}

}
