package com.hui.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hui.pojo.BanVisitUtil;
import com.hui.service.BanVisitService;

@Controller
public class BanVisitController {
	
	@Resource(name="banVisitService")
	private BanVisitService banVisitService;
	
	@RequestMapping("/insert")
	@ResponseBody
	public int insert(@RequestParam String banId,@RequestParam String bvName,@RequestParam String bvSex,
						@RequestParam String bvCredType,@RequestParam String bvCredCode,@RequestParam String bvDesc) {
		Map<String,String> map= new HashMap<String, String>();
		map.put("banId", banId);
		map.put("bvName",bvName);
		map.put("bvSex",bvSex);
		map.put("bvCredType",bvCredType);
		map.put("bvCredCode",bvCredCode);
		map.put("bvDesc",bvDesc);
		int result = banVisitService.insertBanVist(map);
		return result;
	}
	
	@RequestMapping("/insertLeaveTime")
	@ResponseBody
	public int visitorLeavelOutTime(@RequestParam String bvId) {
		int result = banVisitService.visitorLeavelOutTime(Integer.valueOf(bvId));
		return result;
	}
	
	@RequestMapping("/selectByDate")
	@ResponseBody
	public List<BanVisitUtil> selectByDate(@RequestParam String bvDate,HttpSession session) {
		String banId = (String) session.getAttribute("banId");
		Map<String,String> map = new HashMap<String,String>();
		map.put("banId", banId);
		map.put("bvDate", bvDate);
		List<BanVisitUtil> result = banVisitService.selectByDate(map);
		/*for(BanVisitUtil i :result) {
			System.out.println(i.getBvOuttime());
		}*/
		return result;
	}
}
