package com.markkryzh.hotel_software_tool.model;
// Generated 25 ����. 2016 3:50:37 by Hibernate Tools 5.2.0.Beta1

import java.util.Date;

/**
 * ServiceBooking generated by hbm2java
 */
public class ServiceBooking implements java.io.Serializable {

	private int id;
	private Service service;
	private User user;
	private Date atDate;
	private Date atTime;
	private double price;

	public ServiceBooking() {
	}

	public ServiceBooking(int id, Service service, User user, Date atDate, Date atTime, double price) {
		this.id = id;
		this.service = service;
		this.user = user;
		this.atDate = atDate;
		this.atTime = atTime;
		this.price = price;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Service getService() {
		return this.service;
	}

	public void setService(Service service) {
		this.service = service;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getAtDate() {
		return this.atDate;
	}

	public void setAtDate(Date atDate) {
		this.atDate = atDate;
	}

	public Date getAtTime() {
		return this.atTime;
	}

	public void setAtTime(Date atTime) {
		this.atTime = atTime;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

}
