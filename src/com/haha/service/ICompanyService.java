package com.haha.service;

import com.haha.entity.Company;

import java.io.Serializable;

public interface ICompanyService {
    public Serializable signup(Company user);
    public boolean checkLogin(Company user);
    public boolean checkName(String name);
    public boolean checkEmail(String email);
    public boolean checktel(String tel);
    public Company getCompany(String idf);
}
