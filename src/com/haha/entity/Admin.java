package com.haha.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Admin {
    private String id;
    private String password;

    public Admin() {

    }

    @Id
    @Column(name = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Admin admin = (Admin) o;

        if (id != null ? !id.equals(admin.id) : admin.id != null) return false;
        if (password != null ? !password.equals(admin.password) : admin.password != null) return false;

        return true;
    }

    public Admin(String id, String password) {
        this.id = id;
        this.password = password;
    }
    @Override
    public String toString() {
        return "Admin{" +
                "id='" + id + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (password != null ? password.hashCode() : 0);
        return result;
    }
}
