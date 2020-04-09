package com.haha.dao;

import com.haha.entity.Admin;

public interface IAdminDao {
    public void addAdmin(Admin admin);
    public void modifyAdmin(Admin admin);
    public Admin queryOneByID(String id);

}
