package com.in.vo;

import java.sql.Date;

public class BoardVO {
	
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int viewsCnt;
	
	public BoardVO() {
		
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getViewsCnt() {
		return viewsCnt;
	}

	public void setViewsCnt(int viewsCnt) {
		this.viewsCnt = viewsCnt;
	}

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regDate="
				+ regDate + ", viewsCnt=" + viewsCnt + "]";
	}
	
	
	
}
