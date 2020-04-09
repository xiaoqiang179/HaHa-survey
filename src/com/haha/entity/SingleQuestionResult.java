package com.haha.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class SingleQuestionResult {
    private String id;
    private Integer userid;
    private String result;

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
    @Column(name = "result")
    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SingleQuestionResult that = (SingleQuestionResult) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (userid != null ? !userid.equals(that.userid) : that.userid != null) return false;
        if (result != null ? !result.equals(that.result) : that.result != null) return false;

        return true;
    }

    public SingleQuestionResult(String id, Integer userid, String result) {
        this.id = id;
        this.userid = userid;
        this.result = result;
    }

    public SingleQuestionResult() {
    }

    @Override
    public String toString() {
        return "SingleQuestionResult{" +
                "id='" + id + '\'' +
                ", userid=" + userid +
                ", result='" + result + '\'' +
                '}';
    }

    @Override
    public int hashCode() {
        int result1 = id != null ? id.hashCode() : 0;
        result1 = 31 * result1 + (userid != null ? userid.hashCode() : 0);
        result1 = 31 * result1 + (result != null ? result.hashCode() : 0);
        return result1;
    }
}
