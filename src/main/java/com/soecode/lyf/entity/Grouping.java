package com.soecode.lyf.entity;

public class Grouping {
    private Integer id;

    private Integer nextboxid;

    private String name;

    private String sort;

    private String isenable;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNextboxid() {
        return nextboxid;
    }

    public void setNextboxid(Integer nextboxid) {
        this.nextboxid =nextboxid;
    }

    public String getName() {
        return name;
    }

    public void setName(String naem) {
        this.name = naem == null ? null : naem.trim();
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort == null ? null : sort.trim();
    }

    public String getIsenable() {
        return isenable;
    }

    public void setIsenable(String isenable) {
        this.isenable = isenable == null ? null : isenable.trim();
    }
}