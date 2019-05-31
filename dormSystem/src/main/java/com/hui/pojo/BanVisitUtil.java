package com.hui.pojo;


public class BanVisitUtil {
    private String banId;

    private String bvName;

    private String bvSex;

    private String bvCredType;

    private String bvCredCode;

    private String bvDesc;

    private String bvDate;

    private String bvIntime;

    private String bvOuttime;

    public BanVisitUtil() {
    	
    }
    
    public BanVisitUtil(String banId,String bvName,String bvSex,String bvCredType,String bvCredCode,String bvDesc,String bvDate,String bvIntime,String bvOuttime) {
    	this.banId = banId;
    	this.bvName = banId;
    	this.bvSex = bvSex;
    	this.bvCredCode = bvCredCode;
    	this.bvCredType = bvCredType;
    	this.bvDate = bvDate;
    	this.bvDesc = bvDesc;
    	this.bvIntime = bvIntime;
    	this.bvOuttime = bvOuttime;
    }

	public String getBanId() {
		return banId;
	}

	public void setBanId(String banId) {
		this.banId = banId;
	}

	public String getBvName() {
		return bvName;
	}

	public void setBvName(String bvName) {
		this.bvName = bvName;
	}

	public String getBvSex() {
		return bvSex;
	}

	public void setBvSex(String bvSex) {
		this.bvSex = bvSex;
	}

	public String getBvCredType() {
		return bvCredType;
	}

	public void setBvCredType(String bvCredType) {
		this.bvCredType = bvCredType;
	}

	public String getBvCredCode() {
		return bvCredCode;
	}

	public void setBvCredCode(String bvCredCode) {
		this.bvCredCode = bvCredCode;
	}

	public String getBvDesc() {
		return bvDesc;
	}

	public void setBvDesc(String bvDesc) {
		this.bvDesc = bvDesc;
	}

	public String getBvDate() {
		return bvDate;
	}

	public void setBvDate(String bvDate) {
		this.bvDate = bvDate;
	}

	public String getBvIntime() {
		return bvIntime;
	}

	public void setBvIntime(String bvIntime) {
		this.bvIntime = bvIntime;
	}

	public String getBvOuttime() {
		return bvOuttime;
	}

	public void setBvOuttime(String bvOuttime) {
		this.bvOuttime = bvOuttime;
	}
}
