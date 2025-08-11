package com.beans;

import java.util.List;

public class MenuInfo {
	private int id;
	private String menuName;
	private String target;
	private String url;
	private int parentid;
	private String icon;
	private List<MenuInfo> subMenuList;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getParentid() {
		return parentid;
	}
	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public List<MenuInfo> getSubMenuList() {
		return subMenuList;
	}
	public void setSubMenuList(List<MenuInfo> subMenuList) {
		this.subMenuList = subMenuList;
	}
	@Override
	public String toString() {
		return "MenuInfo [id=" + id + ", menuName=" + menuName + ", target=" + target + ", url=" + url + ", parentid="
				+ parentid + ", icon=" + icon + ", subMenuList=" + subMenuList + "]";
	}
	
	
}
