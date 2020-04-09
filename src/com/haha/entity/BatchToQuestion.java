package com.haha.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class BatchToQuestion {
    private String id;
    private String batchid;
    private String qustid;
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
    @Column(name = "batchid")
    public String getBatchid() {
        return batchid;
    }

    public void setBatchid(String batchid) {
        this.batchid = batchid;
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
    @Column(name = "type")
    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BatchToQuestion that = (BatchToQuestion) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (batchid != null ? !batchid.equals(that.batchid) : that.batchid != null) return false;
        if (qustid != null ? !qustid.equals(that.qustid) : that.qustid != null) return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;

        return true;
    }

    public BatchToQuestion(String id, String batchid, String qustid, Integer type) {
        this.id = id;
        this.batchid = batchid;
        this.qustid = qustid;
        this.type = type;
    }

    public BatchToQuestion() {
    }

    @Override
    public String toString() {
        return "BatchToQuestion{" +
                "id='" + id + '\'' +
                ", batchid='" + batchid + '\'' +
                ", qustid='" + qustid + '\'' +
                ", type=" + type +
                '}';
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (batchid != null ? batchid.hashCode() : 0);
        result = 31 * result + (qustid != null ? qustid.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        return result;
    }
}
