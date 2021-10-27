package com.cmds.web.model;

import javax.validation.constraints.NotBlank;
import java.util.Date;

public class Report {
    private Integer id;
    private Integer userID;
    @NotBlank(message = "Part를 입력해주세요.")
    private String part;
    @NotBlank(message = "Assessment를 입력해주세요.")
    private String assessment;
    @NotBlank(message = "Recommend를 입력해주세요.")
    private String recommend;
    private String imageTarget;
    private Date registerDate;
    private Integer farmKey;
    private Integer cmsKey;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public String getPart() {
        return part;
    }

    public void setPart(String part) {
        this.part = part;
    }

    public String getAssessment() {
        return assessment;
    }

    public void setAssessment(String assessment) {
        this.assessment = assessment;
    }

    public String getRecommend() {
        return recommend;
    }

    public void setRecommend(String recommend) {
        this.recommend = recommend;
    }

    public String getImageTarget() {
        return imageTarget;
    }

    public void setImageTarget(String imageTarget) {
        this.imageTarget = imageTarget;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
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
    
}
