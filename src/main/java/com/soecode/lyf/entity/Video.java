package com.soecode.lyf.entity;

import java.util.Date;

public class Video {
    private Integer id;

    private String adminid;

    private String videoname;

    private String videourl;

    private String videoimgurl;

    private Date greattime;

    private Integer iseenable;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdminid() {
        return adminid;
    }

    public void setAdminid(String adminid) {
        this.adminid = adminid == null ? null : adminid.trim();
    }

    public String getVideoname() {
        return videoname;
    }

    public void setVideoname(String videoname) {
        this.videoname = videoname == null ? null : videoname.trim();
    }

    public String getVideourl() {
        return videourl;
    }

    public void setVideourl(String videourl) {
        this.videourl = videourl == null ? null : videourl.trim();
    }

    public String getVideoimgurl() {
        return videoimgurl;
    }

    public void setVideoimgurl(String videoimgurl) {
        this.videoimgurl = videoimgurl == null ? null : videoimgurl.trim();
    }

    public Date getGreattime() {
        return greattime;
    }

    public void setGreattime(Date greattime) {
        this.greattime = greattime;
    }

    public Integer getIseenable() {
        return iseenable;
    }

    public void setIseenable(Integer iseenable) {
        this.iseenable = iseenable;
    }
}