package com.haha.service;

import com.haha.entity.Admin;

public interface IAdminService {
    public boolean checkLogin(Admin admin);
    public void deleteuser(Integer userid);
    public void deleteCompany(Integer comid);
    public void deletebatch(String batchid);
}
