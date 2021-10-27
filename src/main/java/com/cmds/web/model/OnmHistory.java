package com.cmds.web.model;

import java.sql.Date;
import java.sql.Time;

public class OnmHistory {
    private Integer historyId;
    private Integer userID;
    private Date historyDate;
    private Time historyTime;
    private Integer historyPart;
    private String historyMaintenance;

    public Integer getHistoryId() {
        return historyId;
    }

    public void setHistoryId(Integer historyId) {
        this.historyId = historyId;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public Date getHistoryDate() {
        return historyDate;
    }

    public void setHistoryDate(Date historyDate) {
        this.historyDate = historyDate;
    }

    public Time getHistoryTime() {
        return historyTime;
    }

    public void setHistoryTime(Time historyTime) {
        this.historyTime = historyTime;
    }

    public Integer getHistoryPart() {
        return historyPart;
    }

    public void setHistoryPart(Integer historyPart) {
        this.historyPart = historyPart;
    }

    public String getHistoryMaintenance() {
        return historyMaintenance;
    }

    public void setHistoryMaintenance(String historyMaintenance) {
        this.historyMaintenance = historyMaintenance;
    }
}
