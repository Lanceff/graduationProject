package com.hui.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hui.pojo.Stu;
import com.hui.pojo.StuLateUtil;
import com.hui.service.StuLateService;
import com.hui.service.StuService;

@Controller
public class StuLoginController {
	
	@Resource(name="stuService")
	private StuService stuService;
	
	@Resource(name="stuLateService")
	private StuLateService stuLateService;
	
	@RequestMapping("/stu_oneselfInfo")
	public String getOneSelfInformation(HttpSession session,Model model) {
		Stu stu = stuService.selectOneStu((String) session.getAttribute("usercode"));
		model.addAttribute("stuinfo", stu);
		return "stu_info";
	}
	
	@RequestMapping("/stu_changeInfo")
	public String changeStuInfo(HttpSession session,Model model) {
		Stu stu = stuService.selectOneStu((String) session.getAttribute("usercode"));
		model.addAttribute("stuInfo", stu);
		return "stu_changeInfo";
	}
	
	@RequestMapping("/stu_roomMate")
	public String stu_roomMate(HttpSession session,Model model) {
		List<Stu> lists = stuService.getRoomMate((String)session.getAttribute("stuBanId"),(String)session.getAttribute("stuDormId"));
		model.addAttribute("lists",lists);
		return "stu_roomMate";
	}
	
	@RequestMapping("/stu_stusInfo")
	public String stu_stusInfo(@RequestParam(value="pn",defaultValue="1") Integer pn,Model model) {
		PageHelper.startPage(pn, 5);
		List<Stu> lists = stuService.selectAllStu();
		PageInfo<Stu> pageinfo = new PageInfo<Stu>(lists);
		model.addAttribute("lists", lists);
		model.addAttribute("pageinfo", pageinfo);
		return "stu_stusInfo";
	}
	
	@RequestMapping("/stu_stuLateInfo")
	public String stu_stuLateInfo(@RequestParam(value="pn",defaultValue="1") Integer pn,Model model,HttpSession session) {
		PageHelper.startPage(pn, 5);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("banId", Integer.parseInt((String)session.getAttribute("stuBanId")));
		map.put("stuId", session.getAttribute("usercode"));
		List<StuLateUtil> lists = stuLateService.selectAllByStuId(map);
		PageInfo<StuLateUtil> pageinfo = new PageInfo<StuLateUtil>(lists);
		model.addAttribute("lists", lists);
		model.addAttribute("pageinfo", pageinfo);
		return "stu_stuLateInfo";
	}
	
	@RequestMapping("/selectByBanIdAndDateAndStuId")
	@ResponseBody
	public List<StuLateUtil> selectByBanIdAndDateAndStuId(@RequestParam String bslDate,HttpSession session) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("banId", Integer.parseInt((String)session.getAttribute("stuBanId")));
		map.put("stuId", session.getAttribute("usercode"));
		map.put("bslDate", bslDate);
		List<StuLateUtil> lists = stuLateService.selectByBanIdAndDateAndStuId(map);
		return lists;
	}
	
	@RequestMapping("/stu_monthData")
	public String stu_monthData() {
		return "stu_monthData";
	}
}
