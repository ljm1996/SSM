package com.soecode.lyf.entity;

public class Machine {
    private Integer id;

    private String machinename;

    private String mac;

    private Integer groupingid;

    private String machinekey;

    private String machinecode;

    private String isenable;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMachinename() {
        return machinename;
    }

    public void setMachinename(String machinename) {
        this.machinename = machinename == null ? null : machinename.trim();
    }

    public String getMac() {
        return mac;
    }

    public void setMac(String mac) {
        this.mac = mac == null ? null : mac.trim();
    }

    public Integer getGroupingid() {
        return groupingid;
    }

    public void setGroupingid(Integer groupingid) {
        this.groupingid = groupingid;
    }

    public String getMachinekey() {
        return machinekey;
    }

    public void setMachinekey(String machinekey) {
        this.machinekey = machinekey == null ? null : machinekey.trim();
    }

    public String getMachinecode() {
        return machinecode;
    }

    public void setMachinecode(String machinecode) {
        this.machinecode = machinecode == null ? null : machinecode.trim();
    }

    public String getIsenable() {
        return isenable;
    }

    public void setIsenable(String isenable) {
        this.isenable = isenable == null ? null : isenable.trim();
    }
}