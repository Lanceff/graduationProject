package com.hui.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hui.pojo.StuLateUtil;
import com.hui.service.StuLateService;

@Controller
public class StuLateController {
	
	@Resource(name="stuLateService")
	private StuLateService stuLateService;
	
	@RequestMapping("/insertStuLate")
	@ResponseBody
	public int insertStuLate(@RequestParam String banId,@RequestParam String bslStuId) {
		//System.out.println(banId +"/"+ bslStuId);
		int result = stuLateService.insertStuLate(banId, bslStuId);
		return result;
	}
	
	@RequestMapping("/dormSys_stuLateInfo")
	public String dormSys_stuLateInfo(@RequestParam(value="pn",defaultValue="1") Integer pn,HttpSession session,Model model) {
		PageHelper.startPage(pn, 5);
		List<StuLateUtil> lists = stuLateService.selectBanAll((String) session.getAttribute("banId"));
		PageInfo<StuLateUtil> pageinfo = new PageInfo<StuLateUtil>(lists);
		model.addAttribute("lists", lists);
		model.addAttribute("pageinfo", pageinfo);
		return "dormSys_stuLateInfo";
	}
	
	@RequestMapping("/selectByBanIdAndDate")
	@ResponseBody
	public List<StuLateUtil> selectByBanIdAndDate(@RequestParam String bslDate,HttpSession session) {
		List<StuLateUtil> result = stuLateService.selectByBanIdAndDate((String) session.getAttribute("banId"), bslDate);
		return result;
	}
	
	@RequestMapping("/selectCountStuLate")
	@ResponseBody
	public int selectCountStuLate(@RequestParam String stuId) {
		int result = stuLateService.selectCountStuLate(stuId);
		return result;
	}
}
