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
	
	private Map<String, String> pageMap;
	
	public ServiceController() {
		pageMap = new HashMap<String, String>();
		pageMap.put("walk", "Action/walk");
		pageMap.put("peePoo", "Action/peePoo");
		pageMap.put("eat", "Action/eat");
		pageMap.put("weight", "Action/weight");
		pageMap.put("health", "Action/health");
	}
	
	@Autowired
	private IDiaryService iServ;
	
	@ModelAttribute("sessionInfo")
	public Map<String, Object> setSessionInfo(){
		return new HashMap<String, Object>();
	}
	
	private static final Logger logger = LoggerFactory.getLogger(ServiceController.class);
	
	@RequestMapping(value = "/getPetInfo")
	public String getPetInfo(Model model,
			@RequestParam("petId") int petId,
			@ModelAttribute("sessionInfo") Map<String, Object> sInfo) {
		logger.warn("controller petId = " + petId);
		sInfo.put("petId", petId);
		if(iServ.isDiaryExist(petId, sInfo)) {
			Diary returnDiary = (Diary) sInfo.get("diaryInfo");
			model.addAttribute("diaryList", returnDiary);
		}
		model.addAttribute("disabled", false);
		return "first";
	}
	
	@RequestMapping(value = "/walkProc")
	public String walkProc(Diary diary, Model model,
			@ModelAttribute("sessionInfo") Map<String, Object> sInfo) {
		System.out.println("diary.getWalkvenue : " + diary.getWalkvenue());
		model.addAttribute("msg", iServ.walkProc(diary, sInfo));
		return "forward:/main";
	}
	
	@RequestMapping(value = "/peePooProc")
	public String peePooProc(Diary diary, Model model,
			@ModelAttribute("sessionInfo") Map<String, Object> sInfo) {
		System.out.println("diary.getPee : "+diary.getPee());
		model.addAttribute("msg", iServ.peePooProc(diary, sInfo));
		return "forward:/main";
	}
	
	@RequestMapping(value = "/editProc/{action}")
	public String editProc(Diary diary, Model model,
			@PathVariable("action") String action,
			@ModelAttribute("sessionInfo") Map<String, Object> sInfo) {
		logger.warn("editProc/action = "+action);
		model.addAttribute("diaryList", sInfo.get("diaryInfo"));
		return "/"+pageMap.get(action);
	}
	
}
