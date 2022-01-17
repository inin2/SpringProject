package com.mini.vo;

import java.sql.Date;

public class ReserveVO {
	
	private int reserveId;
	private String memberId;
	private int cakeId;
	private int reserveInfo1;	// 큰 초
	private int reserveInfo2;	// 작은 초
	private String reserveInfo3;// 케이크 칼
	private Date reserveDate;	// 날짜
	private String reserveTime;	// 시간
	
	private String cakeName;
	private String cakeImage;
	
	public ReserveVO() {
		
	}

	public int getReserveId() {
		return reserveId;
	}

	public void setReserveId(int reserveId) {
		this.reserveId = reserveId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getCakeId() {
		return cakeId;
	}

	public void setCakeId(int cakeId) {
		this.cakeId = cakeId;
	}

	public int getReserveInfo1() {
		return reserveInfo1;
	}

	public void setReserveInfo1(int reserveInfo1) {
		this.reserveInfo1 = reserveInfo1;
	}

	public int getReserveInfo2() {
		return reserveInfo2;
	}

	public void setReserveInfo2(int reserveInfo2) {
		this.reserveInfo2 = reserveInfo2;
	}

	public String getReserveInfo3() {
		return reserveInfo3;
	}

	public void setReserveInfo3(String reserveInfo3) {
		this.reserveInfo3 = reserveInfo3;
	}

	public Date getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}

	public String getReserveTime() {
		return reserveTime;
	}

	public void setReserveTime(String reserveTime) {
		this.reserveTime = reserveTime;
	}

	public String getCakeName() {
		return cakeName;
	}

	public void setCakeName(String cakeName) {
		this.cakeName = cakeName;
	}

	public String getCakeImage() {
		return cakeImage;
	}

	public void setCakeImage(String cakeImage) {
		this.cakeImage = cakeImage;
	}
	
}
