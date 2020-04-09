package com.haha.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Dorecord {
    private String id;
    private Integer userid;
    private String batchid;

    @Id
    @Column(name = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Basic
    @Column(name = "userid")
    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    @Basic
    @Column(name = "batchid")
    public String getBatchid() {
        return batchid;
    }

    public void setBatchid(String batchid) {
        this.batchid = batchid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Dorecord dorecord = (Dorecord) o;

        if (id != null ? !id.equals(dorecord.id) : dorecord.id != null) return false;
        if (userid != null ? !userid.equals(dorecord.userid) : dorecord.userid != null) return false;
        if (batchid != null ? !batchid.equals(dorecord.batchid) : dorecord.batchid != null) return false;

        return true;
    }

    public Dorecord(String id, Integer userid, String batchid) {
        this.id = id;
        this.userid = userid;
        this.batchid = batchid;
    }

    public Dorecord() {
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (userid != null ? userid.hashCode() : 0);
        result = 31 * result + (batchid != null ? batchid.hashCode() : 0);
        return result;
    }
}
