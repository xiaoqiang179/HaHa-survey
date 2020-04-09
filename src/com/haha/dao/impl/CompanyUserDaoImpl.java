package com.haha.dao.impl;

import com.haha.dao.ICompanyUserDao;
import com.haha.entity.*;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
@Repository
public class CompanyUserDaoImpl implements ICompanyUserDao {
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public void insert(Company company) {
        sessionFactory.getCurrentSession().save(company);
    }

    @Override
    public void delete(Company company) {
        sessionFactory.getCurrentSession().delete(company);
    }

    @Override
    public void update(Company company) {
        sessionFactory.getCurrentSession().update(company);
    }

    @Override
    public Company queryByEmail(String email) {
        return (Company)sessionFactory.getCurrentSession().createQuery("from Company where email=:p").setParameter("p",email).uniqueResult();
    }

    @Override
    public Company queryByName(String name) {
        return (Company)sessionFactory.getCurrentSession().createQuery("from Company where name=:p").setParameter("p",name).uniqueResult();
    }

    @Override
    public Company queryByTel(String tel) {
        return (Company)sessionFactory.getCurrentSession().createQuery("from Company where tel=:p").setParameter("p",tel).uniqueResult();
    }

    @Override
    public Company queryByID(Integer id) {
        return (Company)sessionFactory.getCurrentSession().createQuery("from Company where id=:p").setParameter("p",id).uniqueResult();
    }

    @Override
    public List<Company> queryAll() {
        return sessionFactory.getCurrentSession().createQuery("from Company").list();
    }
}
