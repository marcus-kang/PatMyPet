package com.pet.diary;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiaryService implements IDiaryService{
	@Autowired
	private IDao iDao;

	@Override
	public String walkProc(Diary diary, Map<String, Object> sInfo) {
		diary.setPetid((Integer) sInfo.get("petId"));
		System.out.println("iServ sInfo petId = "+sInfo.get("petId"));
		if(isDiaryExist(diary.getPetid(), sInfo)) {
			iDao.updateWalk(diary);
			return "정보가 업데이트 되었습니다.";
		}else {
			iDao.insertWalk(diary);
			return "정보가 입력되었습니다.";
		}
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
	public String peePooProc(Diary diary, Map<String, Object> sInfo) {
		diary.setPetid((Integer) sInfo.get("petId"));
		System.out.println("iServ sInfo petId = "+sInfo.get("petId"));
		if(isDiaryExist(diary.getPetid(), sInfo)) {
			iDao.updatePeePoo(diary);
			return "정보가 업데이트 되었습니다.";
		}else {
			iDao.insertPeePoo(diary);
			return "정보가 입력되었습니다.";
		}
	}
}
