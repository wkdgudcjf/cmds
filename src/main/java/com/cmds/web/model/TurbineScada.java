package com.cmds.web.model;

public class TurbineScada {
    private String dt;
    private Double windSpeed;
    private Double windDirection;
    private Double windPower;

    public String getDt() {
        return dt;
    }

    public void setDt(String dt) {
        this.dt = dt;
    }

    public Double getWindSpeed() {
        return windSpeed;
    }

    public void setWindSpeed(Double windSpeed) {
        this.windSpeed = windSpeed;
    }

    public Double getWindDirection() {
        return windDirection;
    }

    public void setWindDirection(Double windDirection) {
        this.windDirection = windDirection;
    }

    public Double getWindPower() {
        return windPower;
    }

    public void setWindPower(Double windPower) {
        this.windPower = windPower;
    }
}
