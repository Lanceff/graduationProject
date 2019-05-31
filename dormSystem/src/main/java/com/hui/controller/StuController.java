package com.hui.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.hui.pojo.Ban;
import com.hui.pojo.Staff;
import com.hui.pojo.Stu;
import com.hui.service.BanService;
import com.hui.service.LoginUserService;
import com.hui.service.StaffService;
import com.hui.service.StuService;

@Controller
public class StuController {
	@Resource(name="stuService")
	private StuService stuService;
	
	@Resource(name="loginUserService")
	private LoginUserService loginUserService;
	
	@Resource(name="staffService")
	private StaffService staffService;
	
	@Resource(name="banService")
	private BanService banService;
	
	@RequestMapping("/selectOneStu")
	@ResponseBody
	public Stu selectOneStu(@RequestParam String stuId) {
		Stu result = stuService.selectOneStu(stuId);
		return result;
	}
	
	@RequestMapping("/selectOneByParam")
	@ResponseBody
	public Stu selectOneByParam(@RequestParam String param) {
		Stu result = stuService.selectOneByParam(param);
		return result;
	}
	
	@RequestMapping("/insertOneStu")
	@ResponseBody
	public int insertOneStu(@RequestBody Stu stu) {
		int result = stuService.insertOneStu(stu);
		if(result==1){
			int rresult = loginUserService.insertStuToLoginTable(stu.getStuId());
			return rresult;
		}
		else {
			return 0;
		}
	}
	
	@RequestMapping("/selectIsExitStuById")
	@ResponseBody
	public int selectIsExitStuById(@RequestParam String stuId) {
		int result = stuService.selectIsExitStuById(stuId);
		//System.out.println(result);
		return result;
	}
	
	@RequestMapping("/sys_operationStu")
	public String sys_operationStu(@RequestParam(value="pn",defaultValue="1") Integer pn,Model model) {
		PageHelper.startPage(pn, 5);
		List<Stu> lists = stuService.selectAllStu();
		PageInfo<Stu> pageinfo = new PageInfo<Stu>(lists);
		List<String> bans = banService.selectBanIdList();
		model.addAttribute("bans",bans);
		model.addAttribute("lists", lists);
		model.addAttribute("pageinfo", pageinfo);
		return "sys_listStu";
	}
	
	@RequestMapping("/delStuById")
	@ResponseBody
	public int delStuById(@RequestParam String stuId) {
		int result = stuService.deleteByStuId(stuId);
		return result;
	}
	
	@RequestMapping("/updateStuInfo")
	@ResponseBody
	public int updateStuInfo(@RequestBody Stu stu) {
		int result = stuService.updateStuInfo(stu);
		return result;
	}
	
	@RequestMapping("/selectOneByParamAndBan")
	@ResponseBody
	public Stu selectOneByParamAndBan(@RequestParam String stuBanId,@RequestParam String param) {
		 Map<String,String> map = new HashMap<String,String>();
		 map.put("param", param);
		 map.put("stuBanId",stuBanId);
		 Stu result = stuService.selectOneByParamAndBan(map);
		 return result;
	}
	
	@RequestMapping("/selectStuByIdAndBan")
	@ResponseBody
	public Stu selectStuByIdAndBan(@RequestParam String stuBanId,@RequestParam String stuId) {
		 Map<String,String> map = new HashMap<String,String>();
		 map.put("stuBanId",stuBanId);
		 map.put("stuId", stuId);
		 Stu result = stuService.selectStuByIdAndBan(map);
		// System.out.println(result.getStuDormId());
		 return result;
	}
	
	@RequestMapping("/stu_banInfo")
	public String dormSys_banInfo(Model model,HttpSession session) {
		Ban baninfo = banService.getOneBanById((String) session.getAttribute("stuBanId"));
		model.addAttribute("baninfo",baninfo);
		return "stu_banInfo";
	}
	
	@RequestMapping("/stu_dormSysInfo")
	public String getOneSelfInformation(HttpSession session,Model model) {
		Staff staffInfo = staffService.selectStaffByBanId((String)session.getAttribute("stuBanId"));
//		System.out.println(staffInfo.getStaffName());
		model.addAttribute("staffInfo", staffInfo);
		return "stu_dormSysInfo";
	}
}
