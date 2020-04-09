package com.haha.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class SubjectiveQuestionResult {
    private String id;
    private Integer userid;
    private String text;

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

    public SubjectiveQuestionResult(String id, Integer userid, String text) {
        this.id = id;
        this.userid = userid;
        this.text = text;
    }

    public SubjectiveQuestionResult() {
    }

    @Basic
    @Column(name = "text")
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SubjectiveQuestionResult that = (SubjectiveQuestionResult) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (userid != null ? !userid.equals(that.userid) : that.userid != null) return false;
        if (text != null ? !text.equals(that.text) : that.text != null) return false;

        return true;
    }

    @Override
    public String toString() {
        return "SubjectiveQuestionResult{" +
                "id='" + id + '\'' +
                ", userid='" + userid + '\'' +
                ", text='" + text + '\'' +
                '}';
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (userid != null ? userid.hashCode() : 0);
        result = 31 * result + (text != null ? text.hashCode() : 0);
        return result;
    }
}
