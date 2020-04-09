package com.haha.entity;

import org.springframework.util.DigestUtils;

import javax.persistence.*;

@Entity
public class User {
    private int id;
    private String name;
    private String tel;
    private String email;
    private String gender;
    private String password;
    private String iconfilename;
    private String likeword;
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }
    @Basic
    @Column(name = "likeword")
    public String getLikeword() {
        return likeword;
    }

    public void setLikeword(String like) {
        this.likeword = like;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "tel")
    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public User(String name, String tel, String email, String gender, String password, String iconfilename, String like) {
        this.name = name;
        this.tel = tel;
        this.email = email;
        this.gender = gender;
        this.password = password;
        this.iconfilename = iconfilename;
        this.likeword = like;
    }

    @Basic
    @Column(name = "gender")
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "iconfilename")
    public String getIconfilename() {
        return iconfilename;
    }

    public void setIconfilename(String iconfilename) {
        this.iconfilename = iconfilename;
    }

    public User(String name, String tel, String email, String gender, String password, String iconfilename) {
        this.name = name;
        this.tel = tel;
        this.email = email;
        this.gender = gender;
        this.password = password;
        this.iconfilename = iconfilename;
    }

    public User() {
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                ", gender='" + gender + '\'' +
                ", password='" + password + '\'' +
                ", iconfilename='" + iconfilename + '\'' +
                ", like='" + likeword + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (id != user.id) return false;
        if (name != null ? !name.equals(user.name) : user.name != null) return false;
        if (tel != null ? !tel.equals(user.tel) : user.tel != null) return false;
        if (email != null ? !email.equals(user.email) : user.email != null) return false;
        if (gender != null ? !gender.equals(user.gender) : user.gender != null) return false;
        if (password != null ? !password.equals(user.password) : user.password != null) return false;
        if (iconfilename != null ? !iconfilename.equals(user.iconfilename) : user.iconfilename != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (tel != null ? tel.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (gender != null ? gender.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (iconfilename != null ? iconfilename.hashCode() : 0);
        return result;
    }
}
