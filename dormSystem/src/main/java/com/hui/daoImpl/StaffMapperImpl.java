package com.hui.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.hui.dao.StaffMapper;
import com.hui.pojo.Staff;

public class StaffMapperImpl implements StaffMapper {
	
	@Autowired
	private SqlSessionFactory sessionFactory;
	
	@Override
	public Staff selectById(String staffId) {
		SqlSession session = sessionFactory.openSession();
		Staff result = session.selectOne("com.hui.dao.StaffMapper.selectById",staffId);
		session.close();
		return result;
	}

	@Override
	public String selectNameById(String staffId) {
		SqlSession session = sessionFactory.openSession();
		String result = session.selectOne("com.hui.dao.StaffMapper.selectNameById", staffId);
		session.close();
		return result;
	}

	@Override
	public List<Staff> selectAllStaff() {
		SqlSession session = sessionFactory.openSession();
		List<Staff> result = session.selectList("com.hui.dao.StaffMapper.selectAllStaff");
		session.close();
		return result;
	}

	@Override
	public int addStaff(Staff staff) {
		SqlSession session = sessionFactory.openSession();
		int result = session.insert("com.hui.dao.StaffMapper.addStaff",staff);
		session.close();
		return result;
		
	}

	@Override
	public int createStaffId() {
		SqlSession session = sessionFactory.openSession();
		int result = session.selectOne("com.hui.dao.StaffMapper.createStaffId");
		session.close();
		return result;
	}

	@Override
	public int deleteStaffById(String staffId) {
		SqlSession session = sessionFactory.openSession();
		int result = session.delete("com.hui.dao.StaffMapper.deleteStaffById",staffId);
		session.close();
		return result;
	}

	@Override
	public int updateStaff(Staff staff) {
		SqlSession session = sessionFactory.openSession();
		int result = session.update("com.hui.dao.StaffMapper.updateStaff",staff);
		session.close();
		return result;
	}

	@Override
	public Staff selectStaffByBanId(String banId) {
		SqlSession session = sessionFactory.openSession();
		Staff result = session.selectOne("com.hui.dao.StaffMapper.selectStaffByBanId",banId);
		session.close();
		return result;
	}

}
