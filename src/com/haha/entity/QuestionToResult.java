package com.haha.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class QuestionToResult {
    private String id;
    private String qustid;
    private String resultid;
    private Integer type;

    @Id
    @Column(name = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Basic
    @Column(name = "qustid")
    public String getQustid() {
        return qustid;
    }

    public void setQustid(String qustid) {
        this.qustid = qustid;
    }

    @Basic
    @Column(name = "resultid")
    public String getResultid() {
        return resultid;
    }

    public void setResultid(String resultid) {
        this.resultid = resultid;
    }

    @Basic
    @Column(name = "type")
    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public QuestionToResult(String id, String qustid, String resultid, Integer type) {
        this.id = id;
        this.qustid = qustid;
        this.resultid = resultid;
        this.type = type;
    }

    public QuestionToResult() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        QuestionToResult that = (QuestionToResult) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (qustid != null ? !qustid.equals(that.qustid) : that.qustid != null) return false;
        if (resultid != null ? !resultid.equals(that.resultid) : that.resultid != null) return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;

        return true;
    }

    @Override
    public String toString() {
        return "QuestionToResult{" +
                "id='" + id + '\'' +
                ", qustid='" + qustid + '\'' +
                ", resultid='" + resultid + '\'' +
                ", type=" + type +
                '}';
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (qustid != null ? qustid.hashCode() : 0);
        result = 31 * result + (resultid != null ? resultid.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        return result;
    }
}
