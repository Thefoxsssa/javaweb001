package com.beans;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class AdminInfo {
	private String id;
	private String note;
	private String password;
	private String adminName;
	private int state;
	private Timestamp editDate;
	private int roleId;
	@Override
	public String toString() {
		return "AdminInfo [id=" + id + ", note=" + note + ", password=" + password + ", adminName=" + adminName
				+ ", state=" + state + ", editDate=" + editDate + ", roleId=" + roleId + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Timestamp getEditDate() {
		return editDate;
	}
	public void setEditDate(Timestamp editDate) {
		this.editDate = editDate;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
}
