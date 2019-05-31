package com.hui.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hui.dao.BanVisitMapper;
import com.hui.pojo.BanVisit;
import com.hui.pojo.BanVisitUtil;
import com.hui.service.BanVisitService;

@Service("banVisitService")
public class BanVisitServiceImpl implements BanVisitService {
	@Autowired
	private BanVisitMapper banVisitMapper;

	@Override
	public int insertBanVist(Map<String, String> map) {
		return banVisitMapper.insertBanVist(map);
	}

	@Override
	public List<BanVisit> outTimeNullList(String banId) {
		return banVisitMapper.outTimeNullList(banId);
	}

	@Override
	public int visitorLeavelOutTime(Integer bvId) {
		return banVisitMapper.visitorLeavelOutTime(bvId);
	}

	@Override
	public List<BanVisit> selectAllVisitInfo(String banId) {
		return banVisitMapper.selectAllVisitInfo(banId);
	}

	@Override
	public List<BanVisitUtil> selectByDate(Map<String, String> map) {
		return banVisitMapper.selectByDate(map);
	}
	
}
