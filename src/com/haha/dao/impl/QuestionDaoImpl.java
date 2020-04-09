package com.haha.dao.impl;

import com.haha.dao.IQuestionDao;
import com.haha.entity.*;
import com.haha.utils.Pair;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Repository
public class QuestionDaoImpl implements IQuestionDao {

    @Autowired
    private SessionFactory sessionFactory;
    /**
     * 根据BatchID查所有题
     * SELECT * FROM batch a,batchToQuestion b,singleQuestion c where a.id=b.batchid and b.qustid=c.id and b.type=1 and a.id=1
     * */
    @Override
    public List<SingleQuestion> querySingleQuestionByBatchID(String BatchID) {
        List<Object[]> list = sessionFactory.getCurrentSession().createQuery("FROM Batch a,BatchToQuestion b,SingleQuestion c where a.id=b.batchid and b.qustid=c.id and b.type=1 and a.id=:p")
                .setParameter("p", BatchID)
                .list();
        List<SingleQuestion> data=new ArrayList();
        for(Object[] objects : list){
            data.add((SingleQuestion) objects[2]);
        }
        return data;
    }
    /**
     *
     * select * from batch a,batchToQuestion b,singleQuestion c,questionToResult d,singleQuestionResult e where a.id=b.batchid and b.qustid=c.id and b.type=1 and c.id=d.qustid and d.resultid=e.id and d.type=1 and a.id=1
     *
     * */
    @Override
    public List<Pair<SingleQuestion,SingleQuestionResult>> querySingleResultByBatchID(String BatchID) {
        List<Object[]> list = sessionFactory.getCurrentSession().createQuery("from Batch a,BatchToQuestion b,SingleQuestion c,QuestionToResult d,SingleQuestionResult e where a.id=b.batchid and b.qustid=c.id and b.type=1 and c.id=d.qustid and d.resultid=e.id and d.type=1 and a.id=:p")
                .setParameter("p", BatchID)
                .list();
        List<Pair<SingleQuestion,SingleQuestionResult>> data=new ArrayList();
        for(Object[] objects : list){
            data.add(Pair.makePair((SingleQuestion) objects[2],(SingleQuestionResult)objects[4]));
        }
        return data;
    }

    @Override
    public List<SubjectiveQuestion> querySubjectiveQuestionByBatchID(String BatchID) {
        List<Object[]> p = sessionFactory.getCurrentSession().createQuery("from Batch a,BatchToQuestion b,SubjectiveQuestion c where a.id=b.batchid and b.qustid=c.id and b.type=2 and a.id=:p")
                .setParameter("p", BatchID)
                .list();
        List<SubjectiveQuestion> data=new ArrayList<>();
        for(Object[] objects : p){
            data.add((SubjectiveQuestion) objects[2]);
        }
        return data;
    }

    @Override
    public List<Pair<SubjectiveQuestion,SubjectiveQuestionResult>> querySubjectiveResultByBatchID(String BatchID) {
        List<Object[]> p = sessionFactory.getCurrentSession().createQuery("from Batch a,BatchToQuestion b,SubjectiveQuestion c,QuestionToResult d,SubjectiveQuestionResult e where a.id=b.batchid and b.qustid=c.id and c.id=d.qustid and d.resultid=e.id and b.type=2 and d.type=2 and a.id=:p")
                .setParameter("p", BatchID)
                .list();
        List<Pair<SubjectiveQuestion,SubjectiveQuestionResult>> data=new ArrayList<>();
        for(Object[] objects : p){
            data.add(Pair.makePair((SubjectiveQuestion)objects[2],(SubjectiveQuestionResult)objects[4]));
        }
        return data;
    }

    @Override
    public List<SingleQuestion> querySingleQuestionByBatchIDAndUserID(String BatchID, Integer userID) {
        List<Object[]> list = sessionFactory.getCurrentSession().createQuery("from Batch a,BatchToQuestion b,SingleQuestion c,QuestionToResult d,SingleQuestionResult e where a.id=b.batchid and b.qustid=c.id and b.type=1 and c.id=d.qustid and d.resultid=e.id and d.type=1 and a.id=:p1 and e.userid=:p2")
                .setParameter("p1", BatchID)
                .setParameter("p2",userID)
                .list();
        List<SingleQuestion> data=new ArrayList<>();
        for(Object[] objects : list){
            data.add((SingleQuestion) objects[2]);
        }
        return data;
    }

    @Override
    public List<Pair<SingleQuestion,SingleQuestionResult>> querySingleResultByBatchIDAndUserID(String BatchID, Integer userID) {
        List<Object[]> list = sessionFactory.getCurrentSession().createQuery("from Batch a,BatchToQuestion b,SingleQuestion c,QuestionToResult d,SingleQuestionResult e where a.id=b.batchid and b.qustid=c.id and b.type=1 and c.id=d.qustid and d.resultid=e.id and d.type=1 and a.id=:p1 and e.userid=:p2")
                .setParameter("p1", BatchID)
                .setParameter("p2",userID)
                .list();
        List<Pair<SingleQuestion,SingleQuestionResult>> data=new ArrayList<>();
        for(Object[] objects : list){
            data.add(Pair.makePair((SingleQuestion)objects[2],(SingleQuestionResult)objects[4]));
        }
        return data;
    }

    @Override
    public List<SubjectiveQuestion> querySubjectiveQuestionByBatchIDAndUserID(String BatchID, Integer userID) {
        List<Object[]> p = sessionFactory.getCurrentSession().createQuery("from Batch a,BatchToQuestion b,SubjectiveQuestion c,QuestionToResult d,SubjectiveQuestionResult e where a.id=b.batchid and b.qustid=c.id and c.id=d.qustid and d.resultid=e.id and b.type=2 and d.type=2 and a.id=:p1 and e.userid=:p2")
                .setParameter("p1", BatchID)
                .setParameter("p2",userID)
                .list();
        List<SubjectiveQuestion> data=new ArrayList<>();
        for(Object[] objects : p){
            data.add((SubjectiveQuestion) objects[2]);
        }
        return data;
    }

    @Override
    public List<Pair<SubjectiveQuestion,SubjectiveQuestionResult>> querySubjectiveQuestionResultByBatchIDAndUserID(String BatchID, Integer userID) {
        List<Object[]> p = sessionFactory.getCurrentSession().createQuery("from Batch a,BatchToQuestion b,SubjectiveQuestion c,QuestionToResult d,SubjectiveQuestionResult e where a.id=b.batchid and b.qustid=c.id and c.id=d.qustid and d.resultid=e.id and b.type=2 and d.type=2 and a.id=:p1 and e.userid=:p2")
                .setParameter("p1", BatchID)
                .setParameter("p2",userID)
                .list();
        List<Pair<SubjectiveQuestion,SubjectiveQuestionResult>> data=new ArrayList<>();
        for(Object[] objects : p){
            data.add(Pair.makePair((SubjectiveQuestion)objects[2],(SubjectiveQuestionResult)objects[4]));
        }
        return data;
    }

    @Override
    public void addBatch(Batch batch) {
        sessionFactory.getCurrentSession().save(batch);
    }

    @Override
    public void addSingleQuestion(SingleQuestion singleQuestion) {
        sessionFactory.getCurrentSession().save(singleQuestion);
    }

    @Override
    public void addSubjectiveQuestion(SubjectiveQuestion subjectiveQuestion) {
        sessionFactory.getCurrentSession().save(subjectiveQuestion);
    }

    @Override
    public List<Batch> queryBatchByUserID(Integer userID) {
        return sessionFactory.getCurrentSession().createQuery("from Batch where belong=:p").setParameter("p",userID).list();
    }

    @Override
    public void addQuestionToBatch(BatchToQuestion batchToQuestion) {
        sessionFactory.getCurrentSession().save(batchToQuestion);
    }

    @Override
    public List<Batch> queryBatchByDesp(String desp) {
        return sessionFactory.getCurrentSession().createQuery("from Batch where desp=:p and ispassed=1").setParameter("p",desp).list();
    }

    @Override
    public Batch queryBatchByID(String ID) {
        return (Batch)sessionFactory.getCurrentSession().createQuery("from Batch where id=:p").setParameter("p",ID).uniqueResult();
    }

    @Override
    public void addQuestionToResult(QuestionToResult questionToResult) {
        sessionFactory.getCurrentSession().save(questionToResult);
    }

    @Override
    public void addSingleResult(SingleQuestionResult singleQuestionResult) {
        sessionFactory.getCurrentSession().save(singleQuestionResult);
    }

    @Override
    public void addSubjectiveResult(SubjectiveQuestionResult subjectiveQuestionResult) {
        sessionFactory.getCurrentSession().save(subjectiveQuestionResult);
    }

    @Override
    public List<Batch> queryDoneByUserID(Integer userID){
        List<Object[]> p = sessionFactory.getCurrentSession().createQuery("from Dorecord a,Batch b where a.batchid=b.id and a.userid=:p").setParameter("p", userID).list();
        List<Batch> batches=new ArrayList<>();
        for(Object[] objects: p){
            batches.add((Batch) objects[1]);
        }
        return batches;
    }

    @Override
    public void addDoRecord(Dorecord dorecord) {
        sessionFactory.getCurrentSession().save(dorecord);
    }

    @Override
    public List<Batch> queryAllBatch() {
        return sessionFactory.getCurrentSession().createQuery("from Batch where ispassed=1").list();
    }

    @Override
    public List<Batch> queryByKeyWord(String keyWord) {
        return sessionFactory.getCurrentSession().createQuery("from Batch where (batchname like :p and ispassed=1) or (desp like :p and ispassed=1)").setParameter("p","%"+keyWord+"%").list();
    }

    @Override
    public List<Batch> queryAllByPageNum(Integer pageNum) {
        List from_batch = sessionFactory.getCurrentSession().createQuery("from Batch where ispassed=1").setFirstResult((pageNum - 1) * 20).setMaxResults(20).list();
        return from_batch;
    }

    @Override
    public Integer calTotalPageNum() {
        List<Batch> batches = queryAllBatch();
        Integer datasize=batches.size();
        if(datasize%20==0){
            return datasize/20;
        }
        else{
            return datasize/20+1;
        }
    }

    @Override
    public List<Batch> queryAllByBelongPaged(Integer belong, Integer pagenum) {
        List p = sessionFactory.getCurrentSession().createQuery("from Batch where ispassed=1 and belong=:p")
                .setParameter("p", belong)
                .setFirstResult((pagenum - 1) * 20)
                .setMaxResults(20)
                .list();
        return p;
    }

    @Override
    public Integer calcalTotalPageNumByBelong(Integer belong) {
        List p = sessionFactory.getCurrentSession().createQuery("from Batch where ispassed=1 and belong=:p")
                .setParameter("p", belong)
                .list();
        Integer size=p.size();
        if(size%20==0){
            return size/20;
        }
        else{
            return size/20+1;
        }
    }

    @Override
    public List<Batch> queryAllUnPassed() {
        return sessionFactory.getCurrentSession().createQuery("from Batch where ispassed=0").list();
    }

    @Override
    public void update(Batch batch) {
        sessionFactory.getCurrentSession().update(batch);
    }
    @Override
    public void Deletebatch(Batch batch) {
        sessionFactory.getCurrentSession().delete(batch);
    }
}
