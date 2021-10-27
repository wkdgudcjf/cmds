package com.cmds.web.model;

public class CmdsGroupInfo {
	private Integer groupInfoID;
    private Integer groupID;
    private Integer FARM_KEY;
    private Integer CMS_KEY;
	public Integer getGroupInfoID() {
		return groupInfoID;
	}
	public void setGroupInfoID(Integer groupInfoID) {
		this.groupInfoID = groupInfoID;
	}
	public Integer getGroupID() {
		return groupID;
	}
	public void setGroupID(Integer groupID) {
		this.groupID = groupID;
	}
	public Integer getFARM_KEY() {
		return FARM_KEY;
	}
	public void setFARM_KEY(Integer FARM_KEY) {
		this.FARM_KEY = FARM_KEY;
	}
	public Integer getCMS_KEY() {
		return CMS_KEY;
	}
	public void setCMS_KEY(Integer CMS_KEY) {
		this.CMS_KEY = CMS_KEY;
	}
}
