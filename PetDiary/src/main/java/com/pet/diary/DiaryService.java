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
		diary.setPetid(Integer.parseInt((String) sInfo.get("petId")));
		if(isDiaryExist(diary.getPetid())) {
			iDao.updateWalk(diary);
			return "정보가 업데이트 되었습니다.";
		}else {
			iDao.insertWalk(diary);
			return "정보가 입력되었습니다.";
		}
	}
	
	public boolean isDiaryExist(int petId) {
		int count = iDao.isDiaryExist(petId);
		if (count == 0) {
			System.out.println("petId가 없습니다.");
			return false;
		}
		else if(count == 1) {
			System.out.println("petId = " + petId);
			return true;
		}
		return false;
	}
}
