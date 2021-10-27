package com.cmds.web.model;

public class TurbineStats {
    private String dt;
    private Integer ioDevice;
    private Double totalWhDiff;
    private Double w;
    private Double availability;

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

    public Double getTotalWhDiff() {
        return totalWhDiff;
    }

    public void setTotalWhDiff(Double totalWhDiff) {
        this.totalWhDiff = totalWhDiff;
    }

    public Double getW() {
        return w;
    }

    public void setW(Double w) {
        this.w = w;
    }

    public Double getAvailability() {
        return availability;
    }

    public void setAvailability(Double availability) {
        this.availability = availability;
    }
}
