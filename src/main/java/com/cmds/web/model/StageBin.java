package com.cmds.web.model;

public class StageBin {
    private String dt;
    private Integer farmKey;
    private Integer cmsKey;
    private Integer chNo;
    private Integer chType;
    private Double unitAvg;

    public String getDt() {
        return dt;
    }

    public void setDt(String dt) {
        this.dt = dt;
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

    public Double getUnitAvg() {
        return unitAvg;
    }

    public void setUnitAvg(Double unitAvg) {
        this.unitAvg = unitAvg;
    }
}
