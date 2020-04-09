package com.haha.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class indexController {

    @RequestMapping({"/index", "/"})
    public String toIndex() {
        return "index";
    }

    @RequestMapping("/fail")
    public String toFail() {
        return "fail";
    }

}
