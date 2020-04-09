package com.haha.service.impl;

import com.haha.dao.IQuestionDao;
import com.haha.entity.*;
import com.haha.service.IQuestionService;
import com.haha.utils.Pair;
import com.haha.utils.QUESTIONTYPE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class QuestionService implements IQuestionService {
    @Autowired
    private IQuestionDao questionDao;
    @Override
    public void prcessAfterDoBatch(Map<String, String[]> data) {
        System.out.println(data);
        Integer userId=Integer.parseInt(data.get("userid")[0]);
        String batchId=data.get("batchid")[0];
        questionDao.addDoRecord(new Dorecord(UUID.randomUUID().toString(),userId,batchId));
        data.forEach((key,value)->{
            System.out.println(key+" "+value[0]);
            if(key.startsWith("radio")){
                String tmp=value[0];
                String resultid=UUID.randomUUID().toString();
                questionDao.addQuestionToResult(new QuestionToResult(UUID.randomUUID().toString(),tmp.substring(0,36),resultid, QUESTIONTYPE.SINGLE));
                questionDao.addSingleResult(new SingleQuestionResult(resultid,userId,tmp.substring(37,38)));
            }
            else if(key.startsWith("su")){
                String text=value[0];
                String qustid=key.substring(3,39);
                String resultid=UUID.randomUUID().toString();
                questionDao.addQuestionToResult(new QuestionToResult(UUID.randomUUID().toString(),qustid,resultid, QUESTIONTYPE.SUBJECTIVE));
                questionDao.addSubjectiveResult(new SubjectiveQuestionResult(resultid,userId,text));
            }
        });
    }

    @Override
    public List<Batch> getAllUnPassed(Integer compid) {
        List<Batch> batches = questionDao.queryBatchByUserID(compid);
        List<Batch> data=new ArrayList<>();
        for(Batch batch : batches){
            if(batch.getIspassed()==0){
                data.add(batch);
            }
        }
        return data;
    }

    @Override
    public List<Batch> getAllFailed(Integer compid) {
        List<Batch> batches = questionDao.queryBatchByUserID(compid);
        List<Batch> data=new ArrayList<>();
        for(Batch batch : batches){
            if(batch.getIspassed()==2){
                data.add(batch);
            }
        }
        return data;
    }

    @Override
    public List<Batch> getByBatchPaged(int pagenum, Integer belong) {
        return null;
    }

    @Override
    public void processAddData(Map<String, String[]> data) {
        String batchid=data.get("batchid")[0];
        String batchname=data.get("batchname")[0];
        String batchdesp=data.get("batchdesp")[0];String belong=data.get("belong")[0];

        Map<String,SingleQuestion> singles=new HashMap<>();
        Map<String,SubjectiveQuestion> subjectives=new HashMap<>();
        data.forEach((key,value)->{
            if(key.startsWith("si")){
                String qustid=key.substring(3,39);
                if(singles.get(qustid)==null){
                    SingleQuestion singleQuestion=new SingleQuestion();
                    singleQuestion.setId(qustid);
                    singles.put(qustid,singleQuestion);
                }
                if(key.endsWith("-text")){
                    SingleQuestion tmps=singles.get(qustid);
                    tmps.setText(value[0]);
                    singles.put(qustid,tmps);
                }
                else if(key.endsWith("-a")){
                    SingleQuestion tmps=singles.get(qustid);
                    tmps.setTexta(value[0]);
                    singles.put(qustid,tmps);
                }
                else if(key.endsWith("-b")){
                    SingleQuestion tmps=singles.get(qustid);
                    tmps.setTextb(value[0]);
                    singles.put(qustid,tmps);
                }
                else if(key.endsWith("-c")){
                    SingleQuestion tmps=singles.get(qustid);
                    tmps.setTextc(value[0]);
                    singles.put(qustid,tmps);
                }
                else if(key.endsWith("-d")){
                    SingleQuestion tmps=singles.get(qustid);
                    tmps.setTextd(value[0]);
                    singles.put(qustid,tmps);
                }
            }
            else if(key.startsWith("su")){
                String qustid=key.substring(3,39);
                if(subjectives.get(qustid)==null){
                    subjectives.put(qustid,new SubjectiveQuestion(qustid,""));
                }
                if(key.endsWith("-text")){
                    subjectives.put(qustid,new SubjectiveQuestion(qustid,value[0]));
                }
            }
        });
        System.out.println(singles);
        System.out.println(subjectives);
        Batch batch=new Batch(batchid,Integer.parseInt(belong),batchdesp,batchname,"",0);
        questionDao.addBatch(batch);
        singles.forEach((key,value)->{
            BatchToQuestion batchToQuestion=new BatchToQuestion();
            batchToQuestion.setBatchid(batch.getId().substring(0,36));
            batchToQuestion.setId(UUID.randomUUID().toString());
            batchToQuestion.setQustid(value.getId());
            batchToQuestion.setType(QUESTIONTYPE.SINGLE);
            questionDao.addQuestionToBatch(batchToQuestion);
            questionDao.addSingleQuestion(value);
        });
        subjectives.forEach((key,value)->{
            BatchToQuestion batchToQuestion=new BatchToQuestion();
            batchToQuestion.setBatchid(batch.getId().substring(0,36));
            batchToQuestion.setId(UUID.randomUUID().toString());
            batchToQuestion.setQustid(value.getId());
            batchToQuestion.setType(QUESTIONTYPE.SUBJECTIVE);
            questionDao.addQuestionToBatch(batchToQuestion);
            questionDao.addSubjectiveQuestion(value);
        });
    }

    @Override
    public List<Pair<SingleQuestion, Map<String, Integer>>> processSingleData(String batchID) {
        List<Pair<SingleQuestion, SingleQuestionResult>> pairs = questionDao.querySingleResultByBatchID(batchID);
        Map<SingleQuestion,Map<String,Integer>> rec=new HashMap<>();
        for(Pair<SingleQuestion, SingleQuestionResult> data: pairs){
            if(rec.get(data.getKey())==null){
                rec.put(data.getKey(),new HashMap<>());
            }
            Map<String, Integer> stringIntegerMap = rec.get(data.getKey());
            Integer integer = stringIntegerMap.get(data.getValue().getResult());
            if(integer==null){
                stringIntegerMap.put(data.getValue().getResult(),0);
            }
            integer = stringIntegerMap.get(data.getValue().getResult());
            integer++;
            stringIntegerMap.put(data.getValue().getResult(),integer);
            rec.put(data.getKey(),stringIntegerMap);
        }
        List<Pair<SingleQuestion, Map<String, Integer>>> outData=new LinkedList<>();
        rec.forEach((key,value)->{
            outData.add(Pair.makePair(key,value));
        });
        return outData;
    }

    @Override
    public Boolean isDone(String batchid, Integer userid) {
        List<Pair<SingleQuestion, SingleQuestionResult>> pairs = questionDao.querySingleResultByBatchIDAndUserID(batchid, userid);
        if(pairs.size()!=0){
            return true;
        }
        List<Pair<SubjectiveQuestion, SubjectiveQuestionResult>> pairs1 = questionDao.querySubjectiveQuestionResultByBatchIDAndUserID(batchid, userid);
        if(pairs1.size()!=0){
            return true;
        }
        return false;
    }

    @Override
    public List<Pair<SubjectiveQuestion, List<SubjectiveQuestionResult>>> processSubjectiveData(String batchID) {
        List<Pair<SubjectiveQuestion, SubjectiveQuestionResult>> pairs = questionDao.querySubjectiveResultByBatchID(batchID);
        Map<SubjectiveQuestion,List<SubjectiveQuestionResult>> rec=new HashMap<>();
        for(Pair<SubjectiveQuestion, SubjectiveQuestionResult> pair : pairs){
            if(rec.get(pair.getKey())==null){
                List<SubjectiveQuestionResult> tmp=new ArrayList<SubjectiveQuestionResult>();
                rec.put(pair.getKey(),tmp);
            }
            List<SubjectiveQuestionResult> subjectiveQuestionResults = rec.get(pair.getKey());
            subjectiveQuestionResults.add(pair.getValue());
            rec.put(pair.getKey(),subjectiveQuestionResults);
        }
        List<Pair<SubjectiveQuestion,List<SubjectiveQuestionResult>>> out=new ArrayList<>();
        rec.forEach((key,value)->{
            out.add(Pair.makePair(key,value));
        });
        return out;
    }
}
