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
import com.hui.pojo.UseData;
import com.hui.pojo.UseDataKey;
import com.hui.service.UseDataService;

@Controller
public class UseDataController {

	@Resource(name="useDataService")
	private UseDataService useDataService;
	
	@RequestMapping("/stu_allYearData")
	public  String stu_allYearData(HttpSession session,@RequestParam(value="pn",defaultValue="1") Integer pn,Model model) {
		PageHelper.startPage(pn,  5);
		Map<String,String> map = new HashMap<String,String>();
		map.put("banId", (String)session.getAttribute("stuBanId"));
		map.put("dormId", (String)session.getAttribute("stuDormId"));
		List<UseData> lists = useDataService.selectAllYearByDorm(map);
		PageInfo<UseData> pageinfo = new PageInfo<UseData>(lists);
		model.addAttribute("lists", lists);
		model.addAttribute("pageinfo",pageinfo);
		return "stu_allYearData";
	}
	
	@RequestMapping("/selectMonthByDorm")
	@ResponseBody
	public UseData selectMonthByDorm(@RequestParam String month,HttpSession session) {
		UseDataKey useDataKey = new UseDataKey();
		useDataKey.setBanId((String) session.getAttribute("stuBanId"));
		useDataKey.setDormId((String) session.getAttribute("stuDormId"));
		useDataKey.setMonth(month);
		UseData result = (UseData) useDataService.selectMonthByDorm(useDataKey);
		return result;
	}
}
