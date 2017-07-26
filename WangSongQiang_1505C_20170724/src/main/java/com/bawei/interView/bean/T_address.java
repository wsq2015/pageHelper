package com.bawei.interView.bean;

public class T_address {
    private Integer id;

    private String useraddress;

    private Integer uid;
    
    private T_user t_user;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUseraddress() {
        return useraddress;
    }

    public void setUseraddress(String useraddress) {
        this.useraddress = useraddress == null ? null : useraddress.trim();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

	public T_user getT_user() {
		return t_user;
	}

	public void setT_user(T_user t_user) {
		this.t_user = t_user;
	}

	@Override
	public String toString() {
		return "T_address [id=" + id + ", useraddress=" + useraddress
				+ ", uid=" + uid + ", t_user=" + t_user + "]";
	}
	
}