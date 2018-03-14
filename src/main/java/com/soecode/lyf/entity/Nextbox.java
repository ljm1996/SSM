package com.soecode.lyf.entity;

import java.util.Date;

public class Nextbox {
    private Integer id;

    private String adminid;

    private String groupname;

    private String lic;

    private String lan;

    private String phone;

    private Date greattime;

    private String isenable;

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

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname == null ? null : groupname.trim();
    }

    public String getLic() {
        return lic;
    }

    public void setLic(String lic) {
        this.lic = lic == null ? null : lic.trim();
    }

    public String getLan() {
        return lan;
    }

    public void setLan(String lan) {
        this.lan = lan == null ? null : lan.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Date getGreattime() {
        return greattime;
    }

    public void setGreattime(Date greattime) {
        this.greattime = greattime;
    }

    public String getIsenable() {
        return isenable;
    }

    public void setIsenable(String isenable) {
        this.isenable = isenable == null ? null : isenable.trim();
    }
}