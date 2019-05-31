package com.hui.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hui.pojo.Stu;

@Service("stuService")
public interface StuService {
		public Stu selectOneStu(String stuId);
	    public int insertOneStu(Stu stu);
	    public List<Stu> selectAllStu();
	    public int selectIsExitStuById(String stuId);
	    public Stu selectOneByParam(String param);
	    public int deleteByStuId(String stuId);
	    public int updateStuInfo(Stu stu);
	    public String getStuNameById(String stuId);
	    
	    public List<Stu> selectStusByBan(String stuBanId);
	    public Stu selectOneByParamAndBan(Map<String, String> map);
	    public Stu selectStuByIdAndBan(Map<String, String> map);
	    public List<Stu> getRoomMate(String stuBanId,String stuDormId);
}
