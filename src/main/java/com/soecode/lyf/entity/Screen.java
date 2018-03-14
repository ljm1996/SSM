package com.soecode.lyf.entity;

import java.util.Date;

public class Screen {
    private Integer id;

    private String pix;

    private Integer machineid;

    private Date greatetime;

    private String isenable;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPix() {
        return pix;
    }

    public void setPix(String pix) {
        this.pix = pix == null ? null : pix.trim();
    }

    public Integer getMachineid() {
        return machineid;
    }

    public void setMachineid(Integer machineid) {
        this.machineid = machineid;
    }

    public Date getGreatetime() {
        return greatetime;
    }

    public void setGreatetime(Date greatetime) {
        this.greatetime = greatetime;
    }

    public String getIsenable() {
        return isenable;
    }

    public void setIsenable(String isenable) {
        this.isenable = isenable == null ? null : isenable.trim();
    }
}