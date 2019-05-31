package com.hui.service;

import java.util.List;
import java.util.Map;

import com.hui.pojo.StuLateUtil;

public interface StuLateService {
	 
	 public int insertStuLate(String banId,String bslStuId);
	 public List<StuLateUtil> selectBanAll(String banId);
	 public List<StuLateUtil> selectByBanIdAndDate(String banId,String bslDate);
	 
	 public List<StuLateUtil> selectAllByStuId(Map<String, Object> map);
	 public List<StuLateUtil> selectByBanIdAndDateAndStuId(Map<String, Object> map);
	 public int selectCountStuLate(String stuId);
}
