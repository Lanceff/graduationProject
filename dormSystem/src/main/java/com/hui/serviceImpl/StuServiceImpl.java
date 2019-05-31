package com.hui.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hui.dao.LoginUserMapper;
import com.hui.dao.StuMapper;
import com.hui.pojo.Stu;
import com.hui.service.StuService;

@Service("stuService")
public class StuServiceImpl implements StuService {
	
	@Autowired
	private StuMapper stuMapper;
	
	@Autowired
	private LoginUserMapper loginUserMapper;
	
	@Override
	public Stu selectOneStu(String stuId) {
		return stuMapper.selectOneStu(stuId);
	}

	@Override
	public int insertOneStu(Stu stu) {
		return stuMapper.insertOneStu(stu);
	}

	@Override
	public List<Stu> selectAllStu() {
		return stuMapper.selectAllStu();
	}

	@Override
	public int selectIsExitStuById(String stuId) {
		return stuMapper.selectIsExitStuById(stuId);
	}

	@Override
	public Stu selectOneByParam(String param) {
		return stuMapper.selectOneByParam(param);
	}

	@Override
	public int deleteByStuId(String stuId) {
		int flag = stuMapper.deleteByStuId(stuId);
		if(flag==1) {
			return loginUserMapper.deleteByCode(stuId);
		}
		else {
			return 0;
		}
		
	}

	@Override
	public int updateStuInfo(Stu stu) {
		return stuMapper.updateStuInfo(stu);
	}

	@Override
	public String getStuNameById(String stuId) {
		return stuMapper.getStuNameById(stuId);
	}

	@Override
	public List<Stu> selectStusByBan(String stuBanId) {
		return stuMapper.selectStusByBan(stuBanId);
	}

	@Override
	public Stu selectOneByParamAndBan(Map<String, String> map) {
		return stuMapper.selectOneByParamAndBan(map);
	}

	@Override
	public Stu selectStuByIdAndBan(Map<String, String> map) {
		return stuMapper.selectStuByIdAndBan(map);
	}

	@Override
	public List<Stu> getRoomMate(String stuBanId, String stuDormId) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("stuBanId", stuBanId);
		map.put("stuDormId", stuDormId);
		return stuMapper.getRoomMate(map);
	}

}
