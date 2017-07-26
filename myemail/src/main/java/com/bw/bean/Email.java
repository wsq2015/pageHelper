package com.bw.bean;

import java.util.Date;

public class Email {
    private Integer id;

    private String efrom;

    private Integer status;

    private String title;

    private String content;

    private Date createtime;

    
    
    
    @Override
	public String toString() {
		return "Email [id=" + id + ", efrom=" + efrom + ", status=" + status
				+ ", title=" + title + ", content=" + content + ", createtime="
				+ createtime + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEfrom() {
        return efrom;
    }

    public void setEfrom(String efrom) {
        this.efrom = efrom == null ? null : efrom.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}