package com.haha.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Company {
    private int id;
    private String name;
    private String tel;
    private String email;
    private String gender;
    private String password;
    private String iconfilename;
    private String companyname;
    private String companytype;
    private String companydesp;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
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

    @Basic
    @Column(name = "companyname")
    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname;
    }

    @Basic
    @Column(name = "companytype")
    public String getCompanytype() {
        return companytype;
    }

    public void setCompanytype(String companytype) {
        this.companytype = companytype;
    }

    @Basic
    @Column(name = "companydesp")
    public String getCompanydesp() {
        return companydesp;
    }

    public void setCompanydesp(String companydesp) {
        this.companydesp = companydesp;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Company company = (Company) o;

        if (id != company.id) return false;
        if (name != null ? !name.equals(company.name) : company.name != null) return false;
        if (tel != null ? !tel.equals(company.tel) : company.tel != null) return false;
        if (email != null ? !email.equals(company.email) : company.email != null) return false;
        if (gender != null ? !gender.equals(company.gender) : company.gender != null) return false;
        if (password != null ? !password.equals(company.password) : company.password != null) return false;
        if (iconfilename != null ? !iconfilename.equals(company.iconfilename) : company.iconfilename != null)
            return false;
        if (companyname != null ? !companyname.equals(company.companyname) : company.companyname != null) return false;
        if (companytype != null ? !companytype.equals(company.companytype) : company.companytype != null) return false;
        if (companydesp != null ? !companydesp.equals(company.companydesp) : company.companydesp != null) return false;

        return true;
    }

    @Override
    public String toString() {
        return "Company{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                ", gender='" + gender + '\'' +
                ", password='" + password + '\'' +
                ", iconfilename='" + iconfilename + '\'' +
                ", companyname='" + companyname + '\'' +
                ", companytype='" + companytype + '\'' +
                ", companydesp='" + companydesp + '\'' +
                '}';
    }

    public Company(String name, String tel, String email, String gender, String password, String iconfilename, String companyname, String companytype, String companydesp) {
        this.name = name;
        this.tel = tel;
        this.email = email;
        this.gender = gender;
        this.password = password;
        this.iconfilename = iconfilename;
        this.companyname = companyname;
        this.companytype = companytype;
        this.companydesp = companydesp;
    }

    public Company() {
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
        result = 31 * result + (companyname != null ? companyname.hashCode() : 0);
        result = 31 * result + (companytype != null ? companytype.hashCode() : 0);
        result = 31 * result + (companydesp != null ? companydesp.hashCode() : 0);
        return result;
    }
}
