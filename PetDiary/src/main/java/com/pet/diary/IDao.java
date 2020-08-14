package com.pet.diary;

public interface IDao {

	public int isDiaryExist(int petId);
	public Diary updateWalk(Diary diary);
	public void insertWalk(Diary diary);
	
}
