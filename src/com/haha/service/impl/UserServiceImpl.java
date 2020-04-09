package com.haha.service.impl;

import com.haha.dao.IQuestionDao;
import com.haha.dao.IUserDao;
import com.haha.entity.Batch;
import com.haha.entity.User;
import com.haha.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao dao;
    @Autowired
    private IQuestionDao questionDao;

    @Override
    public Serializable signup(User user) {
        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        return dao.insert(user);
    }

    @Override
    public boolean checkLogin(User user) {
        User u1=dao.queryByName(user.getName());
        System.out.println(u1);
        if (u1!=null&&u1.getPassword().equals(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()))) {
            return true;
        }
        User u2=dao.queryByEmail(user.getName());
        System.out.println(u2);
        if (u2!=null&&u2.getPassword().equals(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()))) {
            return true;
        }
        User u3=dao.queryByTel(user.getName());
        System.out.println(u3);
        if (u3!=null&&u3.getPassword().equals(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()))) {
            return true;
        }
        return false;
    }

    @Override
    public boolean checkName(String name) {
        User user = dao.queryByName(name);
        if(user==null){
            return true;
        }
        return false;
    }

    @Override
    public boolean checkEmail(String email) {
        User user = dao.queryByEmail(email);
        if(user==null){
            return true;
        }
        return false;
    }

    @Override
    public boolean checktel(String tel) {
        User user = dao.queryByTel(tel);
        if(user==null){
            return true;
        }
        return false;
    }

    @Override
    public List<Batch> getLikeBatch(User user) {
        List<Batch> result=new ArrayList<>();
        String[] words = user.getLikeword().split(" ");
        for(int i=0;i<words.length;i++){
            List<Batch> batches = questionDao.queryBatchByDesp(words[i]);
            int num=0;
            for(Batch batch : batches){
                result.add(batch);
                num++;
                if(num>4){
                    break;
                }
            }
        }
        if(result.size()>20){
            List<Batch> newresult=new ArrayList<>();
            for(int i=0;i<20;i++){
                newresult.add(result.get(i));
            }
            return newresult;
        }
        return result;
    }

    @Override
    public User getUser(String identity) {
        User u1=dao.queryByName(identity);
        if(u1!=null){
            return u1;
        }
        User u2=dao.queryByEmail(identity);
        if(u2!=null){
            return u2;
        }
        User u3=dao.queryByTel(identity);
        if(u3!=null){
            return u3;
        }
        return null;
    }

    @Override
    public void update(User user) {
        dao.update(user);
    }
}
