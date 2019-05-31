package com.hui.pojo;

public class LoginUser {
    private String usercode;

    private String password;

    private String identity;
    
    public LoginUser() {
    	
    }
    
    public LoginUser(String usercode,String password,String identity) {
    	this.usercode = usercode;
    	this.password = password;
    	this.identity = identity;
    }
    
    public String getUsercode() {
        return usercode;
    }

    public void setUsercode(String usercode) {
        this.usercode = usercode == null ? null : usercode.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity == null ? null : identity.trim();
    }
    @Override
    public String toString() {
    	String str = "usercode:" + usercode + ",password:" + password + ",identity:" + identity;
    	return str;
    }
}