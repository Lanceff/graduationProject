package com.hui.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hui.pojo.Ban;
import com.hui.service.BanService;
import com.hui.service.LoginUserService;

@Controller
public class BanController {
	@Resource(name="banService")
	private BanService banService;
	
	@Resource(name="loginUserService")
	private LoginUserService loginUserService;
	
	@RequestMapping("/addBan")
	@ResponseBody
	public String insertBan(@RequestParam String banId,@RequestParam String banType,
			@RequestParam Integer banRoomNum,@RequestParam String banDesc) {
		Ban ban = new Ban(banId,banType,"",new Integer(banRoomNum),banDesc);
		int result = banService.selectCountById(banId);
		if(result>0) return "error";
		else {
			banService.insert(ban);
			return "success";
		}
	}
	
	@RequestMapping("/sys_operationBan")
	public String operationDorm(Model model,@RequestParam(value="pn",defaultValue="1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Ban> lists = banService.getAllBan();
		PageInfo<Ban> page = new PageInfo<Ban>(lists);
		model.addAttribute("lists",lists);
		model.addAttribute("pageinfo",page);
		return "sys_listBan";
	}
	
//	@RequestMapping("/sys_fpBanSys")
//	public String listBanStaffIsNull(Model model,@RequestParam(value="pn",defaultValue="1") Integer pn) {
//		PageHelper.startPage(pn, 5);
//		List<Ban> lists = banService.selectStaffIdIsNull();
//		PageInfo<Ban> page = new PageInfo<Ban>(lists);
//		model.addAttribute("lists",lists);
//		model.addAttribute("pageinfo",page);
//		return "sys_fpBanSys";
//	}
	
	
	@RequestMapping("/getBySelect")
	@ResponseBody
	public Ban getOneBan(@RequestParam String banId) {
		Ban result = banService.getOneBanById(banId);
		return result;
	}
	
	@RequestMapping("/isExitBan")
	@ResponseBody
	public int isExitBan(@RequestParam String banId) {
		int result = banService.isExitBan(banId);
		return result; 
	}
	
	@RequestMapping("/delBanById")
	@ResponseBody
	public int delBanById(@RequestParam String banId) {
		int result = banService.delBanById(banId);
		//System.out.println(result);
		return result;
	}
	
	@RequestMapping("/updateBan")
	@ResponseBody
	public int updateBan(@RequestBody Ban ban) {
//		System.out.println(ban.getBanId());
		int result = banService.updateBan(ban);
		return result;
	}
	
	@RequestMapping("/updateBanStaffInfo")
	@ResponseBody
	public int updateBanStaffInfo(@RequestParam String banId,@RequestParam String banStaffId) {
		//System.out.println(banId + "/" +banStaffId);
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("banId", banId);
		paramMap.put("banStaffId", banStaffId);
		
		int flag = banService.banStaffIsExit(banStaffId);
//		System.out.println(flag);
		if(flag>0){
			return 2;
		}
		
		int result = banService.updateBanStaffInfo(paramMap);
		
		if(result==1) {
			int rresult = loginUserService.insertStaffToLoginTable(banStaffId);
			return rresult;
		}
		else {
			return result;
		}
	}
	
	@RequestMapping("/selectBanIdList")
	@ResponseBody
	public List<String> selectBanIdList() {
		List<String> result = banService.selectBanIdList();
		return result;
	}
	
	@RequestMapping("/getBanIdByStaffId")
	@ResponseBody
	public String getBanIdByStaffId(@RequestParam String banStaffId) {
		String result = banService.getBanIdByStaffId(banStaffId);
		return result;
	}
}
