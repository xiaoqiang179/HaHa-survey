package com.haha.controller;

import com.haha.dao.IQuestionDao;
import com.haha.entity.*;
import com.haha.service.IQuestionService;
import com.haha.service.IUserService;
import com.haha.utils.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/qust")
public class questionController {
    @Autowired
    private IQuestionDao questionDao;
    @Autowired
    private IUserService userService;
    @Autowired
    private IQuestionService questionService;

    @RequestMapping("/doqust")
    public String doqust(String batchID, Model model) {
        model.addAttribute("singlequstdata", questionDao.querySingleQuestionByBatchID(batchID));
        model.addAttribute("subjectivequstdata", questionDao.querySubjectiveQuestionByBatchID(batchID));
        model.addAttribute("batchdata", questionDao.queryBatchByID(batchID));
        System.out.println(questionDao.queryBatchByID(batchID));
        return "newdobatch";
    }

    @RequestMapping(value = "/processResult", method = RequestMethod.POST)
    public ModelAndView process(HttpServletRequest request, HttpSession session) {
        Map<String, String[]> parameterMap = request.getParameterMap();
        questionService.prcessAfterDoBatch(parameterMap);
        ModelAndView modelAndView = new ModelAndView("userindex");
        User user = (User) session.getAttribute("user");
        List<Batch> likeBatch = userService.getLikeBatch(user);
        modelAndView.addObject("likeBatchs", likeBatch);
        return modelAndView;
    }

    @RequestMapping("/getdonedetailsingle")
    @ResponseBody
    public List getdetailsingle(Integer userid, String batchId) {
        List<Pair<SingleQuestion, SingleQuestionResult>> pairs = questionDao.querySingleResultByBatchIDAndUserID(batchId, userid);
        return pairs;
    }

    @RequestMapping("/getdonedetailsubjective")
    @ResponseBody
    public List getdetailsubjective(Integer userid, String batchId) {
        List<Pair<SubjectiveQuestion, SubjectiveQuestionResult>> pairs = questionDao.querySubjectiveQuestionResultByBatchIDAndUserID(batchId, userid);
        return pairs;
    }

    @RequestMapping(value = "/processsearch", method = RequestMethod.POST)
    @ResponseBody
    public List<Batch> processSearch(String keyWord) {
        System.out.println(keyWord);
        List<Batch> batches = questionDao.queryByKeyWord(keyWord);
        System.out.println(batches);
        return batches;
    }

    @RequestMapping(value = "/showallpaged", method = RequestMethod.POST)
    @ResponseBody
    public List<Batch> showallpaged(int pagenum) {
        return questionDao.queryAllByPageNum(pagenum);
    }

    @RequestMapping(value = "/showallpagedbycomp", method = RequestMethod.POST)
    @ResponseBody
    public List<Batch> showAllPagedByComp(int pagenum, HttpSession session) {
        Company user = (Company) session.getAttribute("user");
        return questionDao.queryAllByBelongPaged(user.getId(), pagenum);
    }

    @RequestMapping(value = "/addbatch", method = RequestMethod.POST)
    @ResponseBody
    public String addBatch() {
        return UUID.randomUUID().toString();
    }

    @RequestMapping("/getuuid")
    @ResponseBody
    public String getUUID() {
        return UUID.randomUUID().toString();
    }

    @RequestMapping(value = "/processadd", method = RequestMethod.POST)
    public String processAdd(HttpServletRequest request, HttpSession session) {
        Map<String, String[]> parameterMap = request.getParameterMap();
        questionService.processAddData(parameterMap);
        return "compaddbatch";
    }

    @RequestMapping("/processinglesstat")
    @ResponseBody
    public List<Pair<SingleQuestion,Map<String,Integer>>> processSingleStat(String batchId){
        List<Pair<SingleQuestion, Map<String, Integer>>> pairs = questionService.processSingleData(batchId);
        return pairs;
    }

    @RequestMapping(value = "/checkisdone",method = RequestMethod.POST)
    @ResponseBody
    public Boolean checkIsDone(HttpSession session,String batchID){
        User user = (User)session.getAttribute("user");
        int id = user.getId();
        Boolean done = questionService.isDone(batchID, id);
        return done;
    }

    @RequestMapping(value = "/processsubjectivestat",method = RequestMethod.POST)
    @ResponseBody
    public List<Pair<SubjectiveQuestion,List<SubjectiveQuestionResult>>> processSubjectveStat(String batchid){
        return questionService.processSubjectiveData(batchid);
    }

    @RequestMapping(value = "/processpass",method = RequestMethod.POST)
    public String processPass(String batchid,Model model){
        Batch batch = questionDao.queryBatchByID(batchid);
        batch.setIspassed(1);
        questionDao.update(batch);
        model.addAttribute("batchs",questionDao.queryAllUnPassed());
        return "adminwait";
    }
    @RequestMapping(value = "/processunpass",method = RequestMethod.POST)
    public String processUnPass(String batchid,Model model){
        Batch batch = questionDao.queryBatchByID(batchid);
        batch.setIspassed(2);
        questionDao.update(batch);
        model.addAttribute("batchs",questionDao.queryAllUnPassed());
        return "adminwait";
    }
    @RequestMapping("/getsingledata")
    @ResponseBody
    public List<SingleQuestion> getSingleData(String batchid){
        return questionDao.querySingleQuestionByBatchID(batchid);
    }
    @RequestMapping("/getsubjectivedata")
    @ResponseBody
    public List<SubjectiveQuestion> getSubjectiveData(String batchid){
        return questionDao.querySubjectiveQuestionByBatchID(batchid);
    }
}
