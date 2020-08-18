package com.pet.diary;

import java.util.Map;

public interface IDiaryService {
	public String walkProc(Diary diary, Map<String, Object> sInfo); 
	public boolean isDiaryExist(int petId, Map<String, Object> sInfo);
	public String peePooProc(Diary diary, Map<String, Object> sInfo);
}
