package com.dao;

import java.util.List;

import com.beans.MenuInfo;
import com.jdbc.DBUtil;

public class MenuDao {

	public List<MenuInfo> getMenuList(int parentId){
		List<MenuInfo> list = DBUtil.getObjs("select * from menuInfo where parentId = ?", MenuInfo.class, parentId);
		for(MenuInfo o :list) {
			if(o.getParentid()==0) {
				o.setSubMenuList(getMenuList(o.getId()));
			}
			
		}
		return list;
	}
}
