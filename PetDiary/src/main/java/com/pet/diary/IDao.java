package com.pet.diary;

public interface IDao {

	public int isDiaryExist(int petId);
	public void updateWalk(Diary diary);
	public void insertWalk(Diary diary);
	public Diary getDiaryInfo(int petId);
	public void updatePeePoo(Diary diary);
	public void insertPeePoo(Diary diary);
}
