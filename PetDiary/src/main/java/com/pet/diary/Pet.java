package com.pet.diary;

import java.util.Date;

public class Pet {
    private Integer petid;
    private Integer userid;
    private String petname;
    private String petimg;
    private Date petbirth;
    private String petgender;
    private String petspecies;

    public Integer getPetid() {
        return petid;
    }

    public void setPetid(Integer petid) {
        this.petid = petid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getPetname() {
        return petname;
    }

    public void setPetname(String petname) {
        this.petname = petname;
    }

    public String getPetimg() {
        return petimg;
    }

    public void setPetimg(String petimg) {
        this.petimg = petimg;
    }

    public Date getPetbirth() {
        return petbirth;
    }

    public void setPetbirth(Date petbirth) {
        this.petbirth = petbirth;
    }

    public String getPetgender() {
        return petgender;
    }

    public void setPetgender(String petgender) {
        this.petgender = petgender;
    }

    public String getPetspecies() {
        return petspecies;
    }

    public void setPetspecies(String petspecies) {
        this.petspecies = petspecies;
    }

    // Pet 모델 복사
    public void CopyData(Pet param)
    {
        this.petid = param.getPetid();
        this.userid = param.getUserid();
        this.petname = param.getPetname();
        this.petimg = param.getPetimg();
        this.petbirth = param.getPetbirth();
        this.petgender = param.getPetgender();
        this.petspecies = param.getPetspecies();
    }
}
