package com.haha.dao.impl;

import com.haha.dao.IAdminDao;
import com.haha.entity.Admin;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements IAdminDao {
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public void addAdmin(Admin admin) {
        sessionFactory.getCurrentSession().save(admin);
    }

    @Override
    public void modifyAdmin(Admin admin) {
        sessionFactory.getCurrentSession().update(admin);
    }

    @Override
    public Admin queryOneByID(String id) {
        return (Admin)sessionFactory.getCurrentSession().createQuery("from Admin where id=:p").setParameter("p",id).uniqueResult();
    }
}
