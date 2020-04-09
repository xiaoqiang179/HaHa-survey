package com.haha.dao.impl;

import com.haha.dao.IUserDao;
import com.haha.entity.*;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Repository
public class UserDaoImpl implements IUserDao {
    @Autowired
    SessionFactory sessionFactory;

    public Serializable insert(User user){
        return sessionFactory.getCurrentSession().save(user);
    }

    @Override
    public void delete(User user) {
        sessionFactory.getCurrentSession().delete(user);
    }

    @Override
    public void update(User user) {
        sessionFactory.getCurrentSession().update(user);
    }

    @Override
    public User queryById(Integer id) {
        return sessionFactory.getCurrentSession().get(User.class,id);
    }

    @Override
    public List<User> queryAll() {
        return sessionFactory.getCurrentSession().createQuery("from User").list();
    }

    @Override
    public User queryByName(String name) {
        return (User) sessionFactory.getCurrentSession().createQuery("from User where name=:p").setParameter("p",name).uniqueResult();
    }

    @Override
    public User queryByEmail(String email) {
        return (User) sessionFactory.getCurrentSession().createQuery("from User where email=:p").setParameter("p",email).uniqueResult();
    }

    @Override
    public User queryByTel(String tel) {
        return (User) sessionFactory.getCurrentSession().createQuery("from User where tel=:p").setParameter("p",tel).uniqueResult();
    }
}
