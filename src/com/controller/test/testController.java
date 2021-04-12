package com.controller.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class testController {
	@RequestMapping("/tt")
	public String tt() {
		return "test/test";
	}
	
	@RequestMapping("/toPage")
	public String toPage() {
		return "admin/selectGoods";
	}
}
