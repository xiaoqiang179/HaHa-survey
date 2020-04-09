package com.haha.dao;

import com.haha.entity.*;

import java.io.Serializable;
import java.util.List;

public interface IUserDao {
    public Serializable insert(User user);
    public void delete(User user);
    public void update(User user);
    public User queryById(Integer id);
    public List<User> queryAll();
    public User queryByName(String name);
    public User queryByEmail(String email);
    public User queryByTel(String tel);

}
