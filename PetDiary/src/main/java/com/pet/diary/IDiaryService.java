package com.pet.diary;

import java.util.Map;

public interface IDiaryService {
	public Map<String, Object> getPetInfo(int userId);
	public boolean isDiaryExist(int petId, Map<String, Object> sInfo);
	public String addPetProc(Pet pet, Map<String, Object> sInfo);
	public String walkProc(Diary diary, Map<String, Object> sInfo);
	public String peePooProc(Diary diary, Map<String, Object> sInfo);
	public String weightProc(Diary diary, Map<String, Object> sInfo);
	public String healthProc(Diary diary, Map<String, Object> sInfo);
	public String eatProc(Diary diary, Map<String, Object> sInfo);
}
