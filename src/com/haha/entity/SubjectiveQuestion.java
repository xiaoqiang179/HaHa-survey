package com.haha.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class SubjectiveQuestion {
    private String id;
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

        SubjectiveQuestion that = (SubjectiveQuestion) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (text != null ? !text.equals(that.text) : that.text != null) return false;

        return true;
    }

    @Override
    public String toString() {
        return "SubjectiveQuestion{" +
                "id='" + id + '\'' +
                ", text='" + text + '\'' +
                '}';
    }

    public SubjectiveQuestion(String id, String text) {
        this.id = id;
        this.text = text;
    }

    public SubjectiveQuestion() {
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (text != null ? text.hashCode() : 0);
        return result;
    }
}
