package com.hui.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hui.service.BanService;

@Controller
public class SystemManagerController {
	@Resource(name="banService")
	private BanService banService;
	
	@RequestMapping("/sys_addBan")
	public String addSys() {
		return "sys_addBan";
	}
	
	@RequestMapping("/sys_fpBanSys")
	public String distributionBanSys() {
		return "sys_fpBanSys";
	}
	
	@RequestMapping("/sys_addStaff")
	public String sys_addStaff() {
		return "sys_addStaff";
	}
	
	@RequestMapping("/sys_addStu")
	public String sys_addStu(Model model) {
		List<String> lists = banService.selectBanIdList();
		model.addAttribute("lists",lists);
		return "sys_addStu";
	}
	
}
