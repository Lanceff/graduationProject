package com.hui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SystemController {
	@RequestMapping("/quitSys") 
	public String quitSys() {
		return "quitSystem";
	}
}
