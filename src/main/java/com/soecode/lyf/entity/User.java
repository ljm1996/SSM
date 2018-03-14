package com.soecode.lyf.entity;

public class User {
    private Integer id;

    private String name;

    private String password;

    private Integer age;
    
    public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	private int code=0;
    public User() {
		// TODO Auto-generated constructor stub
	}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}