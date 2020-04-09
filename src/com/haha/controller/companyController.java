package com.haha.controller;

import com.haha.dao.ICompanyUserDao;
import com.haha.dao.IQuestionDao;
import com.haha.entity.Company;
import com.haha.entity.User;
import com.haha.service.ICompanyService;
import com.haha.service.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/comp")
public class companyController {
    @Autowired
    private ICompanyService companyService;
    @Autowired
    private ICompanyUserDao userDao;
    @Autowired
    private IQuestionService questionService;
    @Autowired
    private IQuestionDao questionDao;

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String signup(Company user) {
        System.out.println(user);
        user.setIconfilename("/serverimgs/defaulticon.jpg");
        companyService.signup(user);
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(Company user, HttpSession session) {
        boolean res = companyService.checkLogin(user);
        if (res) {
            session.setAttribute("user", companyService.getCompany(user.getName()));
            session.setAttribute("type", "comp");
            return "index";
        } else {
            return "fail";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.setAttribute("user", null);
        session.setAttribute("type", null);
        return "index";
    }

    @RequestMapping("/toRegister")
    public String toRegister() {
        return "compuserRegister";
    }


    @RequestMapping(value = "/checkok", method = RequestMethod.POST)
    @ResponseBody
    public Boolean check(String data, String type) {
        if ("name".equals(type)) {
            return companyService.checkName(data);
        } else if ("email".equals(type)) {
            return companyService.checkEmail(data);
        } else {
            return companyService.checktel(data);
        }
    }

    @RequestMapping("/tocompprofile")
    public String toCompProfile() {
        return "compprofile";
    }

    @RequestMapping(value = "/usericonupdate", method = RequestMethod.POST)
    @ResponseBody
    public String uploadImage(HttpServletRequest request,
                              HttpServletResponse response, HttpSession session,
                              @RequestParam(value = "file", required = true) MultipartFile file)
            throws IllegalStateException, IOException {
        System.out.println("heheh");
        String path = "/Users/jack/serverimgs";
        String fileName = UUID.randomUUID()
                .toString() + file.getOriginalFilename();

        File targetFile = new File(path, fileName);

        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        file.transferTo(targetFile);
        String fileUrl = "/serverimgs/" + fileName;
        Company user = (Company) session.getAttribute("user");
        user.setIconfilename(fileUrl);
        userDao.update(user);
        session.setAttribute("user", user);
        return fileUrl;
    }

    @RequestMapping(value = "/changepwd", method = RequestMethod.POST)
    @ResponseBody
    public void changePwd(String pwd, HttpSession session) {
        Company user = (Company) session.getAttribute("user");
        user.setPassword(DigestUtils.md5DigestAsHex(pwd.getBytes()));
        userDao.update(user);
        session.setAttribute("user", user);
    }

    @RequestMapping("/compindex")
    public String toCompIndex(Model model, HttpSession session) {
        Company user = (Company) session.getAttribute("user");
        model.addAttribute("unpassed", questionService.getAllUnPassed(user.getId()));
        model.addAttribute("failed", questionService.getAllFailed(user.getId()));
        return "compuserindex";
    }


    @RequestMapping("/tocompshowall")
    public String calallpagenumbycomp(HttpSession session, Model model) {
        Company user = (Company) session.getAttribute("user");
        model.addAttribute("total", questionDao.calcalTotalPageNumByBelong(user.getId()));
        return "compuserbatch";
    }

    @RequestMapping("/toaddbatch")
    public String toAddBatch(){
        return "compaddbatch";
    }

    @RequestMapping("/tostat")
    public String toStat(Model model,HttpSession session){
        Company user = (Company) session.getAttribute("user");
        model.addAttribute("total", questionDao.calcalTotalPageNumByBelong(user.getId()));
        return "compstat";
    }

}
