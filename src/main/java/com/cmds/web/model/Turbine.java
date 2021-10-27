package com.cmds.web.model;

public class Turbine {
    private String dt;
    private Integer farmKey;
    private Integer cmsKey;
    private Double windSpeed;
    private Double activePower;
    private Double windDirection;
    private Double pitchAngle;
    private Double rotorSpeed;
    private Integer status;

    /** IWIND > TB_UNIT에서 조회 */
    private String unitName;

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

    public Double getWindSpeed() {
        return windSpeed;
    }

    public void setWindSpeed(Double windSpeed) {
        this.windSpeed = windSpeed;
    }

    public Double getActivePower() {
        return activePower;
    }

    public void setActivePower(Double activePower) {
        this.activePower = activePower;
    }

    public Double getWindDirection() {
        return windDirection;
    }

    public void setWindDirection(Double windDirection) {
        this.windDirection = windDirection;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Double getPitchAngle() {
        return pitchAngle;
    }

    public void setPitchAngle(Double pitchAngle) {
        this.pitchAngle = pitchAngle;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    public Double getRotorSpeed() {
        return rotorSpeed;
    }

    public void setRotorSpeed(Double rotorSpeed) {
        this.rotorSpeed = rotorSpeed;
    }
}
