package com.hui.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hui.dao.StaffMapper;
import com.hui.pojo.Staff;
import com.hui.service.StaffService;

@Service(value="staffService")
public class StaffServiceImpl implements StaffService {
	@Autowired
	private StaffMapper staffMapper;
	
	@Override
	public String selectNameById(String staffId) {
		return staffMapper.selectNameById(staffId);
	}

	@Override
	public Staff selectById(String staffId) {
		return staffMapper.selectById(staffId);
	}

	@Override
	public List<Staff> selectAllStaff() {
		return staffMapper.selectAllStaff();
	}

	@Override
	public int addStaff(Staff staff) {
		return staffMapper.addStaff(staff);
	}

	@Override
	public int createStaffId() {
		return staffMapper.createStaffId();
	}

	@Override
	public int deleteStaffById(String staffId) {
		return staffMapper.deleteStaffById(staffId);
	}

	@Override
	public int updateStaff(Staff staff) {
		return staffMapper.updateStaff(staff);
	}

	@Override
	public Staff selectStaffByBanId(String banId) {
		return staffMapper.selectStaffByBanId(banId);
	}

}
