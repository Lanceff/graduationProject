package com.hui.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hui.pojo.LoginUser;
import com.hui.pojo.Stu;
import com.hui.service.BanService;
import com.hui.service.LoginUserService;
import com.hui.service.StaffService;
import com.hui.service.StuService;

@Controller
public class LoginUserController {
	@Resource(name="loginUserService")
	private LoginUserService loginUserService;
	
	@Resource(name="stuService")
	private StuService stuService;
	
	@Resource(name="staffService")
	private StaffService staffService;
	
	@Resource(name="banService")
	private BanService banService;
	
	@RequestMapping("/login_user")
	public String login(@RequestParam String usercode,@RequestParam String password,@RequestParam String identity,
			 				HttpServletRequest request,HttpSession session) {
		
		LoginUser loginUser = new LoginUser(usercode,password,identity);
		LoginUser user = loginUserService.login(loginUser);
		
		if(user==null) {
			return "/loginError";
		}
		else {
			session.setAttribute("usercode", usercode);
			session.setAttribute("identity", identity);
			
			if(loginUser.getIdentity().equals("1")) {
				return "/sys_index";
			}
			else if(loginUser.getIdentity().equals("2")) {
				String banId = banService.getBanIdByStaffId(usercode);
				String staffName = staffService.selectNameById(usercode);
				session.setAttribute("banId", banId);
				session.setAttribute("dormSysName", staffName);
				return "/dormSys_index";
			}
			else {
				String stuName = stuService.getStuNameById(usercode);
				Stu stu = stuService.selectOneStu(usercode);
				session.setAttribute("stuBanId", stu.getStuBanId());
				session.setAttribute("stuDormId", stu.getStuDormId());
				session.setAttribute("stuName", stuName);
				return "/stu_index";
			}
		}
	}
	
	@RequestMapping("/loginError")
	public String loginError () {
		return "loginError";
	}
	
	@RequestMapping("/sys_index")
	public String sys_index() {
		return "sys_index";
	}
	
	@RequestMapping("/dormSys_index")
	public String dormSys_index() {
		return "dormSys_index";
	}
	
	@RequestMapping("/stu_index")
	public String stu_index() {
		return "stu_index";
	}
	
	@RequestMapping("/changePassword")
	@ResponseBody
	public int changePassword(@RequestBody LoginUser loginUser) {
		int result = loginUserService.changePassword(loginUser);
		return result;
	}
}
