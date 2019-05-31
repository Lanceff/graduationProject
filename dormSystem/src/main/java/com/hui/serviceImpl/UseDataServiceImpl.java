package com.hui.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hui.dao.UseDataMapper;
import com.hui.pojo.UseData;
import com.hui.pojo.UseDataKey;
import com.hui.service.UseDataService;

@Service("useDataService")
public class UseDataServiceImpl implements UseDataService {

	@Autowired
	private UseDataMapper useDataMapper;
	
	@Override
	public List<UseData> selectAllYearByDorm(Map<String, String> map) {
		return useDataMapper.selectAllYearByDorm(map);
	}

	@Override
	public UseData selectMonthByDorm(UseDataKey useDataKey) {
		return useDataMapper.selectMonthByDorm(useDataKey);
	}

}
