package com.hui.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hui.dao.StuLateMapper;
import com.hui.pojo.StuLateUtil;
import com.hui.service.StuLateService;

@Service("stuLateService")
public class StuLateServiceImpl implements StuLateService {
	
	@Autowired
	private StuLateMapper stuLateMapper;

	@Override
	public int insertStuLate(String banId, String bslStuId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("banId", Integer.parseInt(banId));
		map.put("bslStuId", bslStuId);
		return stuLateMapper.insertStuLate(map);
	}

	@Override
	public List<StuLateUtil> selectBanAll(String banId) {
		return stuLateMapper.selectBanAll(Integer.parseInt(banId));
	}

	@Override
	public List<StuLateUtil> selectByBanIdAndDate(String banId, String bslDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("banId", Integer.parseInt(banId));
		map.put("bslDate", bslDate);
		return stuLateMapper.selectByBanIdAndDate(map);
	}

	@Override
	public List<StuLateUtil> selectAllByStuId(Map<String, Object> map) {
		return stuLateMapper.selectAllByStuId(map);
	}

	@Override
	public List<StuLateUtil> selectByBanIdAndDateAndStuId(Map<String, Object> map) {
		return stuLateMapper.selectByBanIdAndDateAndStuId(map);
	}

	@Override
	public int selectCountStuLate(String stuId) {
		return stuLateMapper.selectCountStuLate(stuId);
	}
	
}
