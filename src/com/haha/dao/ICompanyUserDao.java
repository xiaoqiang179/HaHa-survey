package com.haha.dao;

import com.haha.entity.*;

import java.util.List;

public interface ICompanyUserDao {
    public void insert(Company company);
    public void delete(Company company);
    public void update(Company company);
    public Company queryByEmail(String email);
    public Company queryByName(String name);
    public Company queryByTel(String tel);
    public Company queryByID(Integer id);
    public List<Company> queryAll();
}
