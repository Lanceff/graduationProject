package com.hui.dao;

import java.util.List;
import java.util.Map;

import com.hui.pojo.StuLateUtil;

public interface StuLateMapper {
    public int insertStuLate(Map<String,Object> map);
    public List<StuLateUtil> selectBanAll(int banId);
    public List<StuLateUtil> selectByBanIdAndDate(Map<String, Object> map);
    
    public List<StuLateUtil> selectAllByStuId(Map<String, Object> map);
    public List<StuLateUtil> selectByBanIdAndDateAndStuId(Map<String, Object> map);
    public int selectCountStuLate(String stuId);
}