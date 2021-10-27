package com.cmds.web.model;

public class WindTurbineGenerator {
    private String dt;
    private Integer ioDevice;
    private Integer alarmLevel;
    private String alarmDesc;

    public String getDt() {
        return dt;
    }

    public void setDt(String dt) {
        this.dt = dt;
    }

    public Integer getIoDevice() {
        return ioDevice;
    }

    public void setIoDevice(Integer ioDevice) {
        this.ioDevice = ioDevice;
    }

    public Integer getAlarmLevel() {
        return alarmLevel;
    }

    public void setAlarmLevel(Integer alarmLevel) {
        this.alarmLevel = alarmLevel;
    }

    public String getAlarmDesc() {
        return alarmDesc;
    }

    public void setAlarmDesc(String alarmDesc) {
        this.alarmDesc = alarmDesc;
    }
}
