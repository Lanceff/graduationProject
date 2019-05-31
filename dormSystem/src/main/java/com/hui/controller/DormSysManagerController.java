package com.hui.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hui.pojo.Ban;
import com.hui.pojo.BanVisit;
import com.hui.pojo.Staff;
import com.hui.pojo.Stu;
import com.hui.service.BanService;
import com.hui.service.BanVisitService;
import com.hui.service.StaffService;
import com.hui.service.StuService;

@Controller
public class DormSysManagerController {
	
	@Resource(name="staffService")
	private StaffService staffService;
	
	@Resource(name="banService")
	private BanService banService;
	
	@Resource(name="stuService")
	private StuService stuService;
	
	@Resource(name="banVisitService")
	private BanVisitService banVisitService;
	
	@RequestMapping("/dormSys_oneselfInfo")
	public String getOneSelfInformation(HttpSession session,Model model) {
		Staff staffInfo = staffService.selectById((String) session.getAttribute("usercode"));
		model.addAttribute("staffInfo", staffInfo);
		return "dormSys_info";
	}
	
	@RequestMapping("/dormSys_changeInfo")
	public String changeStaffInfo(HttpSession session,Model model) {
		Staff staffInfo = staffService.selectById((String) session.getAttribute("usercode"));
		model.addAttribute("staffInfo", staffInfo);
		return "dormSys_changeInfo";
		
	}
	
	@RequestMapping("/dormSys_addStu")
	public String dormSysAddStu(HttpSession session,Model model) {
//		String banId = banService.getBanIdByStaffId((String) session.getAttribute("usercode"));
		model.addAttribute("banId", (String)session.getAttribute("banId"));
		return "dormSys_addStu";
	}
	
	@RequestMapping("/dormSys_stuInfo")
	public String stuInfoGroupByBan(@RequestParam(value="pn",defaultValue="1") Integer pn,HttpSession session,Model model) {
		PageHelper.startPage(pn, 5);
		List<Stu> lists = stuService.selectStusByBan((String)session.getAttribute("banId"));
		PageInfo<Stu> pageinfo = new PageInfo<Stu>(lists);
		model.addAttribute("lists", lists);
		model.addAttribute("banId", (String)session.getAttribute("banId"));
		model.addAttribute("pageinfo", pageinfo);
		return "dormSys_listStu";
	}
	
	@RequestMapping("/dormSys_addVisit")
	public String addVisit() {
		return "dormSys_addVisit";
	}
	
	@RequestMapping("/dormSys_leaveVisit")
	public String banLeaveVisit(@RequestParam(value="pn",defaultValue="1") Integer pn,HttpSession session,Model modal) {
		PageHelper.startPage(pn, 5);
		List<BanVisit> lists =  banVisitService.outTimeNullList((String) session.getAttribute("banId"));
		PageInfo<BanVisit> pageinfo = new PageInfo<BanVisit>(lists);
		modal.addAttribute("lists", lists);
		modal.addAttribute("pageinfo", pageinfo);
		return "dormSys_leaveVisit";
	}
	
	@RequestMapping("/dormSys_visitInfo")
	public String selectAllVisitInfo(@RequestParam(value="pn",defaultValue="1") Integer pn,HttpSession session,Model modal) {
		PageHelper.startPage(pn, 5);
		List<BanVisit> lists =  banVisitService.selectAllVisitInfo((String) session.getAttribute("banId"));
		PageInfo<BanVisit> pageinfo = new PageInfo<BanVisit>(lists);
		modal.addAttribute("lists", lists);
		modal.addAttribute("pageinfo", pageinfo);
		return "dormSys_visitInfo";
	}
	
	@RequestMapping("/dormSys_addStuLate")
	public String addStuLate(HttpSession session) {
		return "dormSys_addStuLate";
	}
	
	@RequestMapping("/dormSys_banInfo")
	public String dormSys_banInfo(Model model,HttpSession session) {
		Ban baninfo = banService.getOneBanById((String) session.getAttribute("banId"));
		model.addAttribute("baninfo",baninfo);
		return "dormSys_banInfo";
	}
	
	@RequestMapping("/dormSys_changeBanInfo")
	public String dormSys_changeBanInfo(Model model,HttpSession session) {
		Ban baninfo = banService.getOneBanById((String) session.getAttribute("banId"));
		model.addAttribute("baninfo",baninfo);
		return "dormSys_changeBanInfo";
	}
}
