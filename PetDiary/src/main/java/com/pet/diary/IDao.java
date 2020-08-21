package com.pet.diary;

import java.util.Map;

public interface IDao {

	public int isDiaryExist(int petId);
	public Diary getDiaryInfo(int petId);
	public void addPetProc(Pet pet);
	public void updateWalk(Diary diary);
	public void insertWalk(Diary diary);
	public void updateEat(Diary diary);
	public void insertEat(Diary diary);
	public void updatePeePoo(Diary diary);
	public void insertPeePoo(Diary diary);
	public void updateWeight(Diary diary);
	public void insertWeight(Diary diary);
	public void updateHealth(Diary diary);
	public void insertHealth(Diary diary);
	public Map<String, Object> getPetInfo(int userId);
}
