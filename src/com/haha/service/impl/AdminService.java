package com.haha.service.impl;

import com.haha.dao.IAdminDao;
import com.haha.dao.ICompanyUserDao;
import com.haha.dao.IQuestionDao;
import com.haha.dao.IUserDao;
import com.haha.entity.Admin;
import com.haha.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService implements IAdminService {
    @Autowired
    private IAdminDao adminDao;
    @Autowired
    private IUserDao userDao;
    @Autowired
    private ICompanyUserDao companyUserDao;
    @Autowired
    private IQuestionDao questionDao;

    @Override
    public boolean checkLogin(Admin admin) {
        Admin admin1 = adminDao.queryOneByID(admin.getId());
        if(admin1==null){
            return false;
        }
        else if(admin1.getPassword().equals(admin.getPassword())==true){
            return true;
        }
        return false;
    }
    @Override
    public void deleteuser(Integer userid) {
        userDao.delete(userDao.queryById(userid));
    }

    @Override
    public void deleteCompany(Integer comid) {
        companyUserDao.delete(companyUserDao.queryByID(comid));
    }

    @Override
    public void deletebatch(String batchid) {
        questionDao.Deletebatch(questionDao.queryBatchByID(batchid));
    }
}
