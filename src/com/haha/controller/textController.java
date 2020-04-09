package com.haha.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class textController {
    @RequestMapping("/textchart")
    public String totest(){
        return "charttest";
    }
    @RequestMapping("/testdobatch")
    public String todobatch(){
        return "newdobatch";
    }
}
