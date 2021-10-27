package com.cmds.web.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import java.sql.Timestamp;
import java.util.Date;

public class CmdsUser {
    private Integer userID;
    @Email(message = "이메일이 잘못되었습니다.")
    private String email;
    @NotBlank(message = "비밀번호를 입력해주세요.")
    private String password;
    private Date date;
    private Integer groupID;
    private Integer levelID;
    
    private boolean checkList[];
    private int part;
    private boolean main;
    private Integer farmKey;
    private Integer cmsKey;
    public CmdsUser()
    {
    	this.checkList = new boolean[80];
    	this.main = false;
    }
	public CmdsUser(Integer userID, @Email(message = "이메일이 잘못되었습니다.") String email,
			@NotBlank(message = "비밀번호를 입력해주세요.") String password, Date date, Integer groupID, Integer levelID) {
		super();
		this.userID = userID;
		this.email = email;
		this.password = password;
		this.date = date;
		this.groupID = groupID;
		this.levelID = levelID;
		this.checkList = new boolean[80];
		this.main = false;
	}
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Integer getGroupID() {
		return groupID;
	}
	public void setGroupID(Integer groupID) {
		this.groupID = groupID;
	}
	public Integer getLevelID() {
		return levelID;
	}
	public void setLevelID(Integer levelID) {
		this.levelID = levelID;
	}
	public boolean[] getCheckList() {
		return checkList;
	}
	public void setCheckList(boolean[] checkList) {
		this.checkList = checkList;
	}
	public void setCheck(int id , boolean check)
	{
		checkList[id] = check;
	}
	public boolean isMain() {
		return main;
	}
	public void setMain(boolean main) {
		this.main = main;
	}
	public Integer getFarmKey() {
		return farmKey;
	}
	public void setFarmKey(Integer farmKey) {
		this.farmKey = farmKey;
	}
	public Integer getCmsKey() {
		return cmsKey;
	}
	public void setCmsKey(Integer cmsKey) {
		this.cmsKey = cmsKey;
	}
	public int getPart() {
		return part;
	}
	public void setPart(int part) {
		this.part = part;
	}
	
}
