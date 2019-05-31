package com.hui.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hui.pojo.Staff;
import com.hui.service.StaffService;

@Controller
public class StaffController {
	
	@Resource(name="staffService")
	private StaffService staffService;
	
	@RequestMapping("/selectNameById")
	@ResponseBody
	public String selectNameById(@RequestParam String staffId) {
		String result = staffService.selectNameById(staffId);
//		System.out.println(result);
		return result;
	}
	@RequestMapping("/selectOneById")
	@ResponseBody
	public Staff selectOneById(@RequestParam String staffId) {
		Staff result = staffService.selectById(staffId);
		return result;
	}
	
	@RequestMapping("/sys_operationStaff")
	public String selectAllStaff(@RequestParam(value="pn",defaultValue="1") Integer pn,Model model) {
		PageHelper.startPage(pn,5);
		List<Staff> lists = staffService.selectAllStaff();
		PageInfo<Staff> pageinfo = new PageInfo<Staff>(lists);
		model.addAttribute("lists", lists);
		model.addAttribute("pageinfo", pageinfo);
		return "sys_listStaff";
	}
	
	@RequestMapping("/createStaffId") 
	@ResponseBody
	public String createStaffId() {
		int id = staffService.createStaffId();
		int add = id + 1;
		String result = String.valueOf(add);
		return result;
	}
	
	@RequestMapping("/addStaff")
	@ResponseBody
	public int addStaff(@RequestBody Staff staff) {
		int result = staffService.addStaff(staff);
		return result;
	}
	
	@RequestMapping("/deleteStaffById")
	@ResponseBody
	public int deleteStaffById(@RequestParam String staffId) {
		//System.out.println(staffId);
		int result = staffService.deleteStaffById(staffId);
		return result;
	}
	
	@RequestMapping("/updateStaff")
	@ResponseBody
	public int updateStaff(@RequestBody Staff staff,HttpSession session) {
		int result = staffService.updateStaff(staff);
		if(result==1) {
			session.setAttribute("dormSysName", staff.getStaffName());
		}
		return result;
	}
}
