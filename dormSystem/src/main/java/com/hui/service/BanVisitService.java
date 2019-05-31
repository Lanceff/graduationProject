package com.hui.service;

import java.util.List;
import java.util.Map;

import com.hui.pojo.BanVisit;
import com.hui.pojo.BanVisitUtil;

public interface BanVisitService {
	
	public int insertBanVist(Map<String,String> map);
	public List<BanVisit> outTimeNullList(String banId);
	public int visitorLeavelOutTime(Integer bvId);
	public List<BanVisit> selectAllVisitInfo(String banId);
	public List<BanVisitUtil> selectByDate(Map<String,String> map);
}
