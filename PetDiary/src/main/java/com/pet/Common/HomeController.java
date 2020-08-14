package com.pet.Common;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private Map<String, String> pageMap;
	
	public HomeController() {
		pageMap = new HashMap<String, String>();
		pageMap.put("first", "first");
		pageMap.put("walk", "Action/walk");
		pageMap.put("peePoo", "Action/peePoo");
		pageMap.put("eat", "Action/eat");
		pageMap.put("weight", "Action/weight");
		pageMap.put("health", "Action/health");
	}
	
	@RequestMapping(value = "/")
	public String home(Model model/*, @RequestParam(value="userId", required=false) String userId*/) {
		//model.addAttribute("userId", userId);
		return "main";
	}
	/*
	@RequestMapping(value="/first")
	public String first() {
		return "first";
	}*/
	@RequestMapping(value="/{path}")
	public String loadPage(@PathVariable String path) {
		System.out.println(pageMap.get(path));
		return pageMap.get(path);
	}
}
