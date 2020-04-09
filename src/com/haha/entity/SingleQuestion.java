package com.haha.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class SingleQuestion {
    private String id;
    private String text;
    private String texta;
    private String textb;
    private String textc;
    private String textd;

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

    @Basic
    @Column(name = "texta")
    public String getTexta() {
        return texta;
    }

    public void setTexta(String texta) {
        this.texta = texta;
    }

    @Basic
    @Column(name = "textb")
    public String getTextb() {
        return textb;
    }

    public void setTextb(String textb) {
        this.textb = textb;
    }

    @Basic
    @Column(name = "textc")
    public String getTextc() {
        return textc;
    }

    public void setTextc(String textc) {
        this.textc = textc;
    }

    @Basic
    @Column(name = "textd")
    public String getTextd() {
        return textd;
    }

    public void setTextd(String textd) {
        this.textd = textd;
    }

    public SingleQuestion(String id, String text, String texta, String textb, String textc, String textd) {
        this.id = id;
        this.text = text;
        this.texta = texta;
        this.textb = textb;
        this.textc = textc;
        this.textd = textd;
    }

    public SingleQuestion() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SingleQuestion that = (SingleQuestion) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (text != null ? !text.equals(that.text) : that.text != null) return false;
        if (texta != null ? !texta.equals(that.texta) : that.texta != null) return false;
        if (textb != null ? !textb.equals(that.textb) : that.textb != null) return false;
        if (textc != null ? !textc.equals(that.textc) : that.textc != null) return false;
        if (textd != null ? !textd.equals(that.textd) : that.textd != null) return false;

        return true;
    }

    @Override
    public String toString() {
        return "SingleQuestion{" +
                "id='" + id + '\'' +
                ", text='" + text + '\'' +
                ", texta='" + texta + '\'' +
                ", textb='" + textb + '\'' +
                ", textc='" + textc + '\'' +
                ", textd='" + textd + '\'' +
                '}';
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (text != null ? text.hashCode() : 0);
        result = 31 * result + (texta != null ? texta.hashCode() : 0);
        result = 31 * result + (textb != null ? textb.hashCode() : 0);
        result = 31 * result + (textc != null ? textc.hashCode() : 0);
        result = 31 * result + (textd != null ? textd.hashCode() : 0);
        return result;
    }
}
