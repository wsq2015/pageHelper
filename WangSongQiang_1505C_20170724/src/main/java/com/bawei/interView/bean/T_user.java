package com.bawei.interView.bean;

public class T_user {
    private Integer id;

    private String username;

    private Integer password;

    private String phone;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Integer getPassword() {
        return password;
    }

    public void setPassword(Integer password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

	@Override
	public String toString() {
		return "T_user [id=" + id + ", username=" + username + ", password="
				+ password + ", phone=" + phone + "]";
	}
    
    

}