package com.its.rhCommunity.controller;

import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@RequestMapping("/member")
@Controller
public class
MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/login")
    public String login() {
        return "/member/login";
    }
    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO) {
        return "/member/main";
    }
    @GetMapping("/signUp")
    public String signUp() {
        return "/member/save";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO,
                        @RequestParam String firstNum,
                       @RequestParam String memberMobile)throws IOException {
            System.out.println("memberDTO = " + memberDTO);
        memberDTO.setMemberMobile(firstNum+memberMobile);
        memberService.save(memberDTO);
        return "member/login";
    }

}
