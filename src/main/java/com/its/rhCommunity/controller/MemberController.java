package com.its.rhCommunity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class
MemberController {
    @GetMapping("/")
    public String index(){
        return "member/save";
    }
}
