import com.haha.dao.ICompanyUserDao;
import com.haha.dao.IQuestionDao;
import com.haha.dao.IUserDao;
import com.haha.entity.*;
import com.haha.service.IQuestionService;
import com.haha.service.IUserService;
import com.haha.utils.Pair;
import com.haha.utils.QUESTIONTYPE;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.DigestUtils;

import java.util.Comparator;
import java.util.List;
import java.util.Random;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:applicationContext.xml"})
public class test {
    @Autowired
    private SessionFactory sessionFactory;
    @Autowired
    private IUserDao dao;
    @Autowired
    private IUserService service;
    @Autowired
    private IQuestionDao questionDao;
    @Autowired
    private ICompanyUserDao companyUserDao;
    @Autowired
    private IQuestionService questionService;

    @Test
    public void test1(){
        List<Pair<SubjectiveQuestion, SubjectiveQuestionResult>> pairs = questionDao.querySubjectiveQuestionResultByBatchIDAndUserID("1", 2);
        System.out.println(pairs);
    }

    @Test
    public void test2(){
        List<SingleQuestion> singleQuestions = questionDao.querySingleQuestionByBatchID("031f8136-a4a5-41fa-91d6-117194dadbd8");
        for(SingleQuestion singleQuestion : singleQuestions){
            System.out.println(singleQuestion);
        }
    }

    @Test
    public void test3(){
        List<Batch> batches = questionDao.queryBatchByUserID(1);
        for(Batch batch : batches){
            for(int i=0;i<10;i++){
                String questid=UUID.randomUUID().toString();
                questionDao.addSingleQuestion(new SingleQuestion(questid,"CSGO中你最喜欢的枪","AK-47","SG-553","AUG","M4A4"));
                questionDao.addQuestionToBatch(new BatchToQuestion(UUID.randomUUID().toString(),batch.getId(),questid, QUESTIONTYPE.SINGLE));
            }
            String subid=UUID.randomUUID().toString();
            questionDao.addSubjectiveQuestion(new SubjectiveQuestion(subid,"评价一下CSGO"));
            questionDao.addQuestionToBatch(new BatchToQuestion(UUID.randomUUID().toString(),batch.getId(),subid,QUESTIONTYPE.SUBJECTIVE));
        }
    }

    @Test
    public void test4(){
        String words[]={"人","狗","猫","宠物","油价","房价","工资","猪肉","蔬菜","营养饮食","花","城市","运动","学习","效率","作业","升学","大学","学历","人脉","经历","同学"};
        Random rd=new Random();

        for(int j=0;j<1000;j++){
            String name=words[rd.nextInt(words.length)];
            String batchId=UUID.randomUUID().toString();
            questionDao.addBatch(new Batch(batchId,1,name,name+UUID.randomUUID().toString(),"/serverimgs/2630751574077433153Yoshi.PNG",0));
            String qustid=UUID.randomUUID().toString();
            questionDao.addSingleQuestion(new SingleQuestion(qustid,"只是一个题","A","B","C","D"));
            questionDao.addQuestionToBatch(new BatchToQuestion(UUID.randomUUID().toString(),batchId,qustid,QUESTIONTYPE.SINGLE));
        }

    }

    @Test
    public void test5(){
        List<Batch> batches = questionDao.queryByKeyWord("人");
        for(Batch batch : batches){
            System.out.println(batch);
        }
    }
    @Test
    public void ectest(){
        System.out.println(questionDao.querySingleQuestionByBatchID("b4a37be1-9949-42ff-ada5-d09ca29cc0ca"));
    }
}
