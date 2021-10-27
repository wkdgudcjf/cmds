package com.cmds.web.model;

public class Channel {
    private Integer farmKey;
    private Integer cmsKey;
    private Integer chNo;
    private Integer chType;
    private String chName;

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

    public Integer getChNo() {
        return chNo;
    }

    public void setChNo(Integer chNo) {
        this.chNo = chNo;
    }

    public Integer getChType() {
        return chType;
    }

    public void setChType(Integer chType) {
        this.chType = chType;
    }

    public String getChName() {
        return chName;
    }

    public void setChName(String chName) {
        this.chName = chName;
    }
}
