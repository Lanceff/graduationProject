package com.hui.pojo;

import java.util.Date;

public class BanVisit {
    private Integer bvId;

    private String banId;

    private String bvName;

    private String bvSex;

    private String bvCredType;

    private String bvCredCode;

    private String bvDesc;

    private Date bvDate;

    private Date bvIntime;

    private Date bvOuttime;

    public Integer getBvId() {
        return bvId;
    }

    public void setBvId(Integer bvId) {
        this.bvId = bvId;
    }

    public String getBanId() {
        return banId;
    }

    public void setBanId(String banId) {
        this.banId = banId == null ? null : banId.trim();
    }

    public String getBvName() {
        return bvName;
    }

    public void setBvName(String bvName) {
        this.bvName = bvName == null ? null : bvName.trim();
    }

    public String getBvSex() {
        return bvSex;
    }

    public void setBvSex(String bvSex) {
        this.bvSex = bvSex == null ? null : bvSex.trim();
    }

    public String getBvCredType() {
        return bvCredType;
    }

    public void setBvCredType(String bvCredType) {
        this.bvCredType = bvCredType == null ? null : bvCredType.trim();
    }

    public String getBvCredCode() {
        return bvCredCode;
    }

    public void setBvCredCode(String bvCredCode) {
        this.bvCredCode = bvCredCode == null ? null : bvCredCode.trim();
    }

    public String getBvDesc() {
        return bvDesc;
    }

    public void setBvDesc(String bvDesc) {
        this.bvDesc = bvDesc == null ? null : bvDesc.trim();
    }

    public Date getBvDate() {
        return bvDate;
    }

    public void setBvDate(Date bvDate) {
        this.bvDate = bvDate;
    }

    public Date getBvIntime() {
        return bvIntime;
    }

    public void setBvIntime(Date bvIntime) {
        this.bvIntime = bvIntime;
    }

    public Date getBvOuttime() {
        return bvOuttime;
    }

    public void setBvOuttime(Date bvOuttime) {
        this.bvOuttime = bvOuttime;
    }
}