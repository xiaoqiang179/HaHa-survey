package com.haha.service;

import com.haha.entity.Batch;
import com.haha.entity.User;

import java.io.Serializable;
import java.util.List;

public interface IUserService {
    public Serializable signup(User user);
    public boolean checkLogin(User user);
    public boolean checkName(String name);
    public boolean checkEmail(String email);
    public boolean checktel(String tel);
    public List<Batch> getLikeBatch(User user);
    public User getUser(String identity);
    public void update(User user);
}
