package com.cmds.web.model;

public class DriveTrainVibration {
    private String dt;
    private Integer farmKey;
    private Integer cmsKey;
    private Integer alarmLevel;
    private Integer binNo;
    private String alarmDesc;

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

    public Integer getAlarmLevel() {
        return alarmLevel;
    }

    public void setAlarmLevel(Integer alarmLevel) {
        this.alarmLevel = alarmLevel;
    }

    public Integer getBinNo() {
        return binNo;
    }

    public void setBinNo(Integer binNo) {
        this.binNo = binNo;
    }

    public String getAlarmDesc() {
        return alarmDesc;
    }

    public void setAlarmDesc(String alarmDesc) {
        this.alarmDesc = alarmDesc;
    }
}
