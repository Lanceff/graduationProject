package com.hui.dao;

import java.util.List;
import java.util.Map;

import com.hui.pojo.UseData;
import com.hui.pojo.UseDataKey;

public interface UseDataMapper {
	
    public List<UseData> selectAllYearByDorm(Map<String,String> map);
    public UseData selectMonthByDorm(UseDataKey useDataKey);
}