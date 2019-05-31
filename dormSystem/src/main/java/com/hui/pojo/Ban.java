package com.hui.pojo;

public class Ban {
    private String banId;

    private String banType;

    private String banStaffId;

    private Integer banRoomNum;

    private String banDesc;

    public Ban() {
    	
    }
    public Ban(String banId,String banType,String banStaffId,Integer banRoomNum,String banDesc) {
    	this.banId = banId;
    	this.banType = banType;
    	this.banStaffId = banStaffId;
    	this.banRoomNum = banRoomNum;
    	this.banDesc = banDesc;
    }
    
    public String getBanId() {
        return banId;
    }

    public void setBanId(String banId) {
        this.banId = banId == null ? null : banId.trim();
    }

    public String getBanType() {
        return banType;
    }

    public void setBanType(String banType) {
        this.banType = banType == null ? null : banType.trim();
    }

    public String getBanStaffId() {
        return banStaffId;
    }

    public void setBanStaffId(String banStaffId) {
        this.banStaffId = banStaffId == null ? null : banStaffId.trim();
    }

    public Integer getBanRoomNum() {
        return banRoomNum;
    }

    public void setBanRoomNum(Integer banRoomNum) {
        this.banRoomNum = banRoomNum;
    }

    public String getBanDesc() {
        return banDesc;
    }

    public void setBanDesc(String banDesc) {
        this.banDesc = banDesc == null ? null : banDesc.trim();
    }
}