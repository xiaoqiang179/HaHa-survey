package com.haha.controller;

import com.haha.dao.IAdminDao;
import com.haha.dao.ICompanyUserDao;
import com.haha.dao.IQuestionDao;
import com.haha.dao.IUserDao;
import com.haha.entity.*;
import com.haha.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class adminController {
    @Autowired
    private IUserDao dao;
    @Autowired
    private IAdminService adminService;
    @Autowired
    private IAdminDao adminDao;

    @Autowired
    private IQuestionDao questionDao;

    @Autowired
    private ICompanyUserDao iCompanyUserDao;
    @RequestMapping("/toprocessbatch")
    public String toProcessBatch(){
        return "adminwait";
    }
    @RequestMapping("/toadminindex")
    public String toadminIndex(Model model){
        model.addAttribute("alluser",dao.queryAll());
        return "adminindex";
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.setAttribute("user", null);
        session.setAttribute("type", null);
        return "index";
    }
    @RequestMapping("/login")
    public String login(Admin admin, HttpSession session) {
        boolean res = adminService.checkLogin(admin);
        System.out.println(res);
        if (res) {
            session.setAttribute("user", adminDao.queryOneByID(admin.getId()));
            session.setAttribute("type", "admin");
            return "index";
        } else {
            return "fail";
        }
    }

    @RequestMapping("/toadminwait")
    public String toAdminWait(Model model){
        model.addAttribute("batchs",questionDao.queryAllUnPassed());
        return "adminwait";
    }

    @RequestMapping(value = "getunpassedsingle",method = RequestMethod.POST)
    @ResponseBody
    public List<SingleQuestion> getUnPassedSingle(String batchID){
        return questionDao.querySingleQuestionByBatchID(batchID);
    }
    @RequestMapping(value = "getunpassedsubjective",method = RequestMethod.POST)
    @ResponseBody
    public List<SubjectiveQuestion> getUnPassedSubjective(String batchID){
        return questionDao.querySubjectiveQuestionByBatchID(batchID);
    }
    @RequestMapping("/deleteUser")
    public String DeleteUser(int uid,Model model) {
        adminService.deleteuser(uid);
        model.addAttribute("alluser", dao.queryAll());
        return "adminindex";
    }
    @RequestMapping("/deletecom")
    public String DeleteCompany(int comid, Model model){
        adminService.deleteCompany(comid);
        model.addAttribute("allcompany", iCompanyUserDao.queryAll());
        return "admincompany";
    }

    @RequestMapping("/deletebatch")
    public String Deletebatch(String batchid,Model model){
        adminService.deletebatch(batchid);
        model.addAttribute("total", questionDao.calTotalPageNum());
        return "adminall";
    }

    @RequestMapping("/toadmincompany")
    public String toadminconpany(Model model) {
        model.addAttribute("allcompany", iCompanyUserDao.queryAll());
        return "admincompany";

    }

    @RequestMapping("/toadminall")
    public String usershowall(Model model) {
        model.addAttribute("allbatch", questionDao.queryAllBatch());
        model.addAttribute("total", questionDao.calTotalPageNum());
        return "adminall";
    }



    @RequestMapping(value = "getdetail",method = RequestMethod.POST)
    @ResponseBody
    public User getDetail(int uid){
        return dao.queryById(uid);
    }
    @RequestMapping(value = "getdetail2",method = RequestMethod.POST)
    @ResponseBody
    public Company getDetail2(int uid){
        return iCompanyUserDao.queryByID(uid);
    }

    @RequestMapping(value = "addadmin")
    @ResponseBody
    public void addadmin(Admin admin){
        adminDao.addAdmin(admin);

    }
}
