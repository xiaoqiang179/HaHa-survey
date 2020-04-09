package com.haha.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Batch {
    private String id;
    private Integer belong;
    private String desp;
    private String batchname;
    private String batchiconfile;
    private int ispassed;

    @Id
    @Column(name = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Basic
    @Column(name = "belong")
    public Integer getBelong() {
        return belong;
    }

    public void setBelong(Integer belong) {
        this.belong = belong;
    }

    @Basic
    @Column(name = "desp")
    public String getDesp() {
        return desp;
    }

    public void setDesp(String desp) {
        this.desp = desp;
    }

    @Basic
    @Column(name = "batchname")
    public String getBatchname() {
        return batchname;
    }

    public void setBatchname(String batchname) {
        this.batchname = batchname;
    }

    @Basic
    @Column(name = "batchiconfile")
    public String getBatchiconfile() {
        return batchiconfile;
    }

    public void setBatchiconfile(String batchiconfile) {
        this.batchiconfile = batchiconfile;
    }

    @Basic
    @Column(name = "ispassed")
    public int getIspassed() {
        return ispassed;
    }

    public void setIspassed(int ispassed) {
        this.ispassed = ispassed;
    }

    public Batch() {
    }
    public Batch(String id,Integer belong,String desp,String batchname,String batchiconfile,int ispassed){
        this.id=id;
        this.belong=belong;
        this.desp=desp;
        this.batchname=batchname;
        this.batchiconfile=batchiconfile;
        this.ispassed=ispassed;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Batch batch = (Batch) o;

        if (ispassed != batch.ispassed) return false;
        if (id != null ? !id.equals(batch.id) : batch.id != null) return false;
        if (belong != null ? !belong.equals(batch.belong) : batch.belong != null) return false;
        if (desp != null ? !desp.equals(batch.desp) : batch.desp != null) return false;
        if (batchname != null ? !batchname.equals(batch.batchname) : batch.batchname != null) return false;
        if (batchiconfile != null ? !batchiconfile.equals(batch.batchiconfile) : batch.batchiconfile != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (belong != null ? belong.hashCode() : 0);
        result = 31 * result + (desp != null ? desp.hashCode() : 0);
        result = 31 * result + (batchname != null ? batchname.hashCode() : 0);
        result = 31 * result + (batchiconfile != null ? batchiconfile.hashCode() : 0);
        result = 31 * result + ispassed;
        return result;
    }
}
