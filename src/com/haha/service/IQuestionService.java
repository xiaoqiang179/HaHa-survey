package com.haha.service;

import com.haha.entity.*;
import com.haha.utils.Pair;

import java.util.List;
import java.util.Map;

public interface IQuestionService {
    public void prcessAfterDoBatch(Map<String,String[]> data);
    public List<Batch> getAllUnPassed(Integer compid);
    public List<Batch> getAllFailed(Integer compid);
    public List<Batch> getByBatchPaged(int pagenum,Integer belong);
    public void processAddData(Map<String,String[]> data);
    public List<Pair<SingleQuestion,Map<String,Integer>>> processSingleData(String batchID);
    public List<Pair<SubjectiveQuestion,List<SubjectiveQuestionResult>>> processSubjectiveData(String batchID);
    public Boolean isDone(String batchid,Integer userid);
}
