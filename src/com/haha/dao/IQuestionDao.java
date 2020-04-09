package com.haha.dao;

import com.haha.entity.*;
import com.haha.utils.Pair;

import java.util.List;

public interface IQuestionDao {
    public List<SingleQuestion> querySingleQuestionByBatchID(String BatchID);
    public List<Pair<SingleQuestion,SingleQuestionResult>> querySingleResultByBatchID(String BatchID);
    public List<SubjectiveQuestion> querySubjectiveQuestionByBatchID(String BatchID);
    public List<Pair<SubjectiveQuestion,SubjectiveQuestionResult>> querySubjectiveResultByBatchID(String BatchID);
    public List<SingleQuestion> querySingleQuestionByBatchIDAndUserID(String BatchID,Integer userID);
    public List<Pair<SingleQuestion,SingleQuestionResult>> querySingleResultByBatchIDAndUserID(String BatchID,Integer userID);
    public List<SubjectiveQuestion> querySubjectiveQuestionByBatchIDAndUserID(String BatchID,Integer userID);
    public List<Pair<SubjectiveQuestion,SubjectiveQuestionResult>> querySubjectiveQuestionResultByBatchIDAndUserID(String BatchID,Integer userID);
    public void addBatch(Batch batch);
    public void addSingleQuestion(SingleQuestion singleQuestion);
    public void addSubjectiveQuestion(SubjectiveQuestion subjectiveQuestion);
    public List<Batch> queryBatchByUserID(Integer userID);
    public void addQuestionToBatch(BatchToQuestion batchToQuestion);
    public List<Batch> queryBatchByDesp(String desp);
    public Batch queryBatchByID(String ID);
    public void addQuestionToResult(QuestionToResult questionToResult);
    public void addSingleResult(SingleQuestionResult singleQuestionResult);
    public void addSubjectiveResult(SubjectiveQuestionResult subjectiveQuestionResult);
    public List<Batch> queryDoneByUserID(Integer userID);
    public void addDoRecord(Dorecord dorecord);
    public List<Batch> queryAllBatch();
    public List<Batch> queryByKeyWord(String keyWord);
    public List<Batch> queryAllByPageNum(Integer pageNum);
    public Integer calTotalPageNum();
    public List<Batch> queryAllByBelongPaged(Integer belong,Integer pagenum);
    public Integer calcalTotalPageNumByBelong(Integer belong);
    public List<Batch> queryAllUnPassed();
    public void update(Batch batch);
    public void Deletebatch(Batch batch);

}
