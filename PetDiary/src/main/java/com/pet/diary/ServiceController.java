package com.pet.diary;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
	
	@RequestMapping(value = "/getPetDiary")
	public String getPetDiary(Model model,
			@RequestParam("petId") int petId,
			@ModelAttribute("sessionInfo") Map<String, Object> sInfo) {
		logger.warn("controller petId = " + petId);
		sInfo.put("petId", petId);
		if(iServ.isDiaryExist(petId, sInfo)) {
			Diary returnDiary = (Diary) sInfo.get("diaryInfo");
			model.addAttribute("diaryList", returnDiary);
		}
		model.addAttribute("disabled", false);
		return "forward:/first";
	}
	
	@RequestMapping(value = "/addPetProc")
	public String addPetProc(Pet pet, Model model,
			@RequestParam(value="date") @DateTimeFormat(pattern="yyyy-MM-dd") Date date,
			@ModelAttribute("sessionInfo") Map<String, Object> sInfo) {
		pet.setPetbirth(date);
		model.addAttribute("msg", iServ.addPetProc(pet, sInfo));
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/walkProc")
	public String walkProc(Diary diary, Model model,
			@ModelAttribute("sessionInfo") Map<String, Object> sInfo) {
		System.out.println("diary.getWalkvenue : " + diary.getWalkvenue());
		model.addAttribute("msg", iServ.walkProc(diary, sInfo));
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/peePooProc")
	public String peePooProc(Diary diary, Model model,
			@ModelAttribute("sessionInfo") Map<String, Object> sInfo) {
		System.out.println("diary.getPee : "+diary.getPee());
		model.addAttribute("msg", iServ.peePooProc(diary, sInfo));
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/eatProc")
	public String eatProc(Diary diary, Model model,
			@ModelAttribute("sessionInfo") Map<String, Object> sInfo) {
		System.out.println("diary.getEattime : "+diary.getEattime());
		model.addAttribute("msg", iServ.eatProc(diary, sInfo));
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/weightProc")
	public String weightProc(Diary diary, Model model,
			@ModelAttribute("sessionInfo") Map<String, Object> sInfo) {
		System.out.println("diary.getWeight : "+diary.getWeight());
		model.addAttribute("msg", iServ.weightProc(diary, sInfo));
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/healthProc")
	public String healthProc(Diary diary, Model model,
			@ModelAttribute("sessionInfo") Map<String, Object> sInfo) {
		System.out.println("diary.getCondition : "+diary.getCondition());
		model.addAttribute("msg", iServ.healthProc(diary, sInfo));
		return "redirect:/main";
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
