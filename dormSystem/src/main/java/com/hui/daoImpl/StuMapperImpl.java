package com.hui.daoImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.hui.dao.StuMapper;
import com.hui.pojo.Stu;

public class StuMapperImpl implements StuMapper {
	@Autowired
	private SqlSessionFactory sessionFactory;
	
	@Override
	public Stu selectOneStu(String stuId) {
		SqlSession session = sessionFactory.openSession();
		Stu result = session.selectOne("com.hui.dao.StuMapper.selectById",stuId);
		session.close();
		return result;
	}

	@Override
	public int insertOneStu(Stu stu) {
		SqlSession session = sessionFactory.openSession();
		int result = session.insert("com.hui.dao.StuMapper.insertOneStu",stu);
		session.close();
		return result;
	}

	@Override
	public List<Stu> selectAllStu() {
		SqlSession session = sessionFactory.openSession();
		List<Stu> result = session.selectList("com.hui.dao.StuMapper.selectAllStu");
		return result;
	}

	@Override
	public int selectIsExitStuById(String stuId) {
		SqlSession session = sessionFactory.openSession();
		int result = session.selectOne("com.hui.dao.StuMapper.selectIsExitStuById",stuId);
		return result;
	}

	@Override
	public Stu selectOneByParam(String param) {
		SqlSession session = sessionFactory.openSession();
		Stu result = session.selectOne("com.hui.dao.StuMapper.selectOneByParam",param);
		return result;
	}

	@Override
	public int deleteByStuId(String stuId) {
		SqlSession session = sessionFactory.openSession();
		int result = session.delete("com.hui.dao.StuMapper.deleteByStuId",stuId);
		return result;
	}

	@Override
	public int updateStuInfo(Stu stu) {
		SqlSession session = sessionFactory.openSession();
		int result = session.update("com.hui.dao.StuMapper.updateStuInfo",stu);
		return result;
	}

	@Override
	public String getStuNameById(String stuId) {
		SqlSession session = sessionFactory.openSession();
		String result = session.selectOne("com.hui.dao.StuMapper.getStuNameById",stuId);
		return result;
	}

	@Override
	public List<Stu> selectStusByBan(String stuBanId) {
		SqlSession session = sessionFactory.openSession();
		List<Stu> result = session.selectList("com.hui.dao.StuMapper.selectStusByBan",stuBanId);
		return result;
	}

	@Override
	public Stu selectOneByParamAndBan(Map<String, String> map) {
		SqlSession session = sessionFactory.openSession();
		Stu result = session.selectOne("com.hui.dao.StuMapper.selectOneByParamAndBan",map);
		return result;
	}

	@Override
	public Stu selectStuByIdAndBan(Map<String, String> map) {
		SqlSession session = sessionFactory.openSession();
		Stu result = session.selectOne("com.hui.dao.StuMapper.selectStuByIdAndBan",map);
		return result;
	}
	
	@Override
	public List<Stu> getRoomMate(Map<String, String> map) {
		SqlSession session = sessionFactory.openSession();
		List<Stu> result = session.selectList("com.hui.dao.StuMapper.getRoomMate",map);
		return result;
	}
	
}
