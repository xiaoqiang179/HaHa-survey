package com.haha.service.impl;

import com.haha.dao.ICompanyUserDao;
import com.haha.entity.Company;
import com.haha.service.ICompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.io.Serializable;

@Service
public class CompanyService implements ICompanyService {
    @Autowired
    private ICompanyUserDao companyUserDao;

    @Override
    public Serializable signup(Company user) {
        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        companyUserDao.insert(user);
        return "";
    }

    @Override
    public boolean checkLogin(Company user) {
        Company u1=companyUserDao.queryByName(user.getName());
        if (u1!=null&&u1.getPassword().equals(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()))) {
            return true;
        }
        Company u2=companyUserDao.queryByEmail(user.getName());
        if (u2!=null&&u2.getPassword().equals(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()))) {
            return true;
        }
        Company u3=companyUserDao.queryByTel(user.getName());
        if (u3!=null&&u3.getPassword().equals(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()))) {
            return true;
        }
        return false;
    }

    @Override
    public boolean checkName(String name) {
        Company user = companyUserDao.queryByName(name);
        if(user==null){
            return true;
        }
        return false;
    }

    @Override
    public boolean checkEmail(String email) {
        Company user = companyUserDao.queryByEmail(email);
        if(user==null){
            return true;
        }
        return false;
    }

    @Override
    public boolean checktel(String tel) {
        Company user = companyUserDao.queryByTel(tel);
        if(user==null){
            return true;
        }
        return false;
    }

    @Override
    public Company getCompany(String idf) {
        Company company1 = companyUserDao.queryByEmail(idf);
        if(company1!=null){
            return company1;
        }
        Company company2 = companyUserDao.queryByName(idf);
        if(company2!=null){
            return company2;
        }
        Company company3 = companyUserDao.queryByTel(idf);
        if(company3!=null){
            return company3;
        }
        return null;
    }
}
