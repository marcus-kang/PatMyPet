package com.pet.diary;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiaryService implements IDiaryService{
	@Autowired
	private IDao iDao;
	
	private final String UPDATEOK = "정보가 업데이트 되었습니다.";
	private final String INSERTOK = "정보가 입력 되었습니다.";


	@Override
	public Map<String, Object> getPetInfo(int userId) {
		return iDao.getPetInfo(userId);
	}
	
	@Override
	public boolean isDiaryExist(int petId, Map<String, Object> sInfo) {
		int count = iDao.isDiaryExist(petId);
		if (count == 0) {
			System.out.println(petId+"의 diary가 없습니다.");
			return false;
		}
		else if(count > 0) {
			System.out.println(petId+"의 diary가 존재합니다.");
			sInfo.put("diaryInfo", iDao.getDiaryInfo(petId));
			return true;
		}
		return false;
	}

	@Override
	public String addPetProc(Pet pet, Map<String, Object> sInfo) {
		pet.setUserid(1);
		iDao.addPetProc(pet);
		return "반려동물이 추가되었습니다.";
	}

	@Override
	public String walkProc(Diary diary, Map<String, Object> sInfo) {
		diary.setPetid((Integer) sInfo.get("petId"));
		System.out.println("iServ sInfo petId = "+sInfo.get("petId"));
		if(isDiaryExist(diary.getPetid(), sInfo)) {
			iDao.updateWalk(diary);
			return UPDATEOK;
		}else {
			iDao.insertWalk(diary);
			return INSERTOK;
		}
	}
	
	@Override
	public String peePooProc(Diary diary, Map<String, Object> sInfo) {
		diary.setPetid((Integer) sInfo.get("petId"));
		System.out.println("iServ sInfo petId = "+sInfo.get("petId"));
		if(isDiaryExist(diary.getPetid(), sInfo)) {
			iDao.updatePeePoo(diary);
			return UPDATEOK;
		}else {
			iDao.insertPeePoo(diary);
			return INSERTOK;
		}
	}

	@Override
	public String eatProc(Diary diary, Map<String, Object> sInfo) {
		diary.setPetid((Integer) sInfo.get("petId"));
		System.out.println("iServ sInfo petId = "+sInfo.get("petId"));
		if(isDiaryExist(diary.getPetid(), sInfo)) {
			iDao.updateEat(diary);
			return UPDATEOK;
		}else {
			iDao.insertEat(diary);
			return INSERTOK;
		}
	}

	@Override
	public String weightProc(Diary diary, Map<String, Object> sInfo) {
		diary.setPetid((Integer) sInfo.get("petId"));
		System.out.println("iServ sInfo petId = "+sInfo.get("petId"));
		if(isDiaryExist(diary.getPetid(), sInfo)) {
			iDao.updateWeight(diary);
			return UPDATEOK;
		}else {
			iDao.insertWeight(diary);
			return INSERTOK;
		}
	}

	@Override
	public String healthProc(Diary diary, Map<String, Object> sInfo) {
		diary.setPetid((Integer) sInfo.get("petId"));
		System.out.println("iServ sInfo petId = "+sInfo.get("petId"));
		if(isDiaryExist(diary.getPetid(), sInfo)) {
			iDao.updateHealth(diary);
			return UPDATEOK;
		}else {
			iDao.insertHealth(diary);
			return INSERTOK;
		}
	}
}
