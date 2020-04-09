package com.haha.controller;

import com.haha.dao.IQuestionDao;
import com.haha.entity.Batch;
import com.haha.entity.User;
import com.haha.service.IUserService;
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
import java.util.*;

@Controller
@RequestMapping(value = "/user")
public class userController {
    @Autowired
    private IUserService userService;
    @Autowired
    private IQuestionDao questionDao;
    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String signup(User user) {
        System.out.println(user);
        user.setIconfilename("/serverimgs/defaulticon.jpg");
        userService.signup(user);
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(User user, HttpSession session) {
        boolean res = userService.checkLogin(user);
        System.out.println(res);
        if (res) {
            session.setAttribute("user", userService.getUser(user.getName()));
            session.setAttribute("type", "user");
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
        return "userRegister";
    }

    @RequestMapping(value = "/checkok", method = RequestMethod.POST)
    @ResponseBody
    public Boolean check(String data, String type) {
        if ("name".equals(type)) {
            return userService.checkName(data);
        } else if ("email".equals(type)) {
            return userService.checkEmail(data);
        } else {
            return userService.checktel(data);
        }
    }

    @RequestMapping("/userprofile")
    public String touserprofile() {
        return "userprofile";
    }

    @RequestMapping(value = "/changepwd", method = RequestMethod.POST)
    @ResponseBody
    public void changePwd(String pwd, HttpSession session) {
        User user = (User) session.getAttribute("user");
        user.setPassword(DigestUtils.md5DigestAsHex(pwd.getBytes()));
        userService.update(user);
        session.setAttribute("user", user);
    }

    @RequestMapping(value = "/addlikeword", produces = "text/html;charset=UTF-8",method = RequestMethod.POST)
    @ResponseBody
    public String addlikeword(String likeword, HttpSession session, HttpServletResponse response) {
        User user = (User) session.getAttribute("user");
        user.setLikeword(user.getLikeword() + " " + likeword);
        userService.update(user);
        session.setAttribute("user", user);
        //response.setCharacterEncoding("utf-8");
        //response.setContentType("text/html;charset=UTF-8");
        return user.getLikeword();
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
                .toString()+ file.getOriginalFilename();

        File targetFile = new File(path, fileName);

        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        file.transferTo(targetFile);
        String fileUrl = "/serverimgs/"+fileName;
        User user = (User)session.getAttribute("user");
        user.setIconfilename(fileUrl);
        userService.update(user);
        session.setAttribute("user",user);
        return fileUrl;
    }
    @RequestMapping("/userindex")
    public String toUserIndex(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        System.out.println(user + "---------");
        List<Batch> likeBatch = userService.getLikeBatch(user);
        model.addAttribute("likeBatchs", likeBatch);
        return "userindex";
    }
    @RequestMapping("/dobatch")
    public String toDoBatch() {
        return "dobatch";
    }
    @RequestMapping("/usershowall")
    public String usershowall(Model model) {
        model.addAttribute("allbatch", questionDao.queryAllBatch());
        model.addAttribute("total", questionDao.calTotalPageNum());
        return "usershowall";
    }
    @RequestMapping("/userdone")
    public String userDone(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Batch> batches = questionDao.queryDoneByUserID(user.getId());
        model.addAttribute("donedata", batches);
        List<Map<String, Object>> data = new ArrayList<>();
        for (Batch batch : batches) {
            Map<String, Object> tmp = new HashMap<>();
            tmp.put("singledata", questionDao.querySingleResultByBatchIDAndUserID(batch.getId(), user.getId()));
            tmp.put("subjectivedata", questionDao.querySubjectiveQuestionResultByBatchIDAndUserID(batch.getId(), user.getId()));
            data.add(tmp);
        }
        model.addAttribute("detaildata", data);
        return "userdone";
    }
    @RequestMapping("/tosearch")
    public String toSearch(String keyword) {
        return "usersearch";
    }
}
