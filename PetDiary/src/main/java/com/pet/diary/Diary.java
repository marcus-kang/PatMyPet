package com.pet.diary;

import java.util.Date;

public class Diary {
    private Integer diaryid;
    private Integer petId;
    private Date date;
    private String walkvenue;
    private String walkstart;
    private String walkstop;
    private String walkdistance;
    private String pee;
    private String poo;
    private String note;
    private Date eattime;
    private String food;
    private String weight;
    private String condition;

    public Integer getDiaryid() {
        return diaryid;
    }

    public void setDiaryid(Integer diaryid) {
        this.diaryid = diaryid;
    }

    public Integer getPetid() {
        return petId;
    }

    public void setPetid(Integer petid) {
        this.petId = petid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getWalkvenue() {
        return walkvenue;
    }

    public void setWalkvenue(String walkvenue) {
        this.walkvenue = walkvenue;
    }

    public String getWalkstart() {
        return walkstart;
    }

    public void setWalkstart(String walkstart) {
        this.walkstart = walkstart;
    }

    public String getWalkstop() {
        return walkstop;
    }

    public void setWalkstop(String walkstop) {
        this.walkstop = walkstop;
    }

    public String getWalkdistance() {
        return walkdistance;
    }

    public void setWalkdistance(String walkdistance) {
        this.walkdistance = walkdistance;
    }

    public String getPee() {
        return pee;
    }

    public void setPee(String pee) {
        this.pee = pee;
    }

    public String getPoo() {
        return poo;
    }

    public void setPoo(String poo) {
        this.poo = poo;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getEattime() {
        return eattime;
    }

    public void setEattime(Date eattime) {
        this.eattime = eattime;
    }

    public String getFood() {
        return food;
    }

    public void setFood(String food) {
        this.food = food;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    // Diary 모델 복사
    public void CopyData(Diary param)
    {
        this.diaryid = param.getDiaryid();
        this.petId = param.getPetid();
        this.date = param.getDate();
        this.walkvenue = param.getWalkvenue();
        this.walkstart = param.getWalkstart();
        this.walkstop = param.getWalkstop();
        this.walkdistance = param.getWalkdistance();
        this.pee = param.getPee();
        this.poo = param.getPoo();
        this.note = param.getNote();
        this.eattime = param.getEattime();
        this.food = param.getFood();
        this.weight = param.getWeight();
        this.condition = param.getCondition();
    }
}