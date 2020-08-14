package com.pet.diary;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("sessionInfo")
@RequestMapping("/action")
@Controller
public class ServiceController {
	@Autowired
	private IDiaryService iServ;
	
	@ModelAttribute("sessionInfo")
	public Map<String, Object> setSessionInfo(){
		return new HashMap<String, Object>();
	}
	
	private static final Logger logger = LoggerFactory.getLogger(ServiceController.class);
	
	@RequestMapping(value = "/getPetInfo")
	public String getPetInfo(Model model, @RequestParam("petId") String petId, @ModelAttribute("sessionInfo") Map<String, Object> sInfo) {
		logger.warn("petId = " + petId);
		sInfo.put("petId", petId);
		model.addAttribute("petId", petId);
		model.addAttribute("disabled", false);
		return "first";
	}
	
	@RequestMapping(value = "/walkProc")
	public String walkProc(Diary diary, Model model,
			@ModelAttribute("sessionInfo") Map<String, Object> sInfo) {
		logger.warn("walkdistance = "+diary.getWalkdistance());
		model.addAttribute("msg", iServ.walkProc(diary, sInfo));
		return "forward:/first";
	}
	/*
	@RequestMapping(value = "/")
	public String home() {
		return "main";
	}
	@RequestMapping(value="/{path}")
	public String loadPage(@PathVariable String path) {
		return "";
	}*/
}
