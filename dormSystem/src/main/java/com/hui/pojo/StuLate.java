package com.hui.pojo;

import java.util.Date;

public class StuLate {
    private Integer bslId;

    private Integer banId;

    private Date bslDate;

    private String bslStuId;

    private String bslDesc;

    public Integer getBslId() {
        return bslId;
    }

    public void setBslId(Integer bslId) {
        this.bslId = bslId;
    }

    public Integer getBanId() {
        return banId;
    }

    public void setBanId(Integer banId) {
        this.banId = banId;
    }

    public Date getBslDate() {
        return bslDate;
    }

    public void setBslDate(Date bslDate) {
        this.bslDate = bslDate;
    }

    public String getBslStuId() {
        return bslStuId;
    }

    public void setBslStuId(String bslStuId) {
        this.bslStuId = bslStuId == null ? null : bslStuId.trim();
    }

    public String getBslDesc() {
        return bslDesc;
    }

    public void setBslDesc(String bslDesc) {
        this.bslDesc = bslDesc == null ? null : bslDesc.trim();
    }
}