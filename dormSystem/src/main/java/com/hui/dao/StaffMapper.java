package com.hui.dao;

import java.util.List;

import com.hui.pojo.Staff;

public interface StaffMapper {
    public Staff selectById(String staffId);
    public String selectNameById(String staffId);
    public List<Staff> selectAllStaff();
    public int addStaff(Staff staff);
    public int createStaffId();
    public int deleteStaffById(String staffId);
    public int updateStaff(Staff staff);
    public Staff selectStaffByBanId(String banId);
}