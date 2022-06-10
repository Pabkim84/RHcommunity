package com.its.rhCommunity.controller;

import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/documents")

public class DocumentsController {
    @Autowired
    MemberService memberService;
    @GetMapping("/certificate")
    public String certificate(HttpSession session, Model model){
        Long id = (Long) session.getAttribute("id");
        System.out.println("id = " + id);
        MemberDTO memberDTO = memberService.findById(id);
        System.out.println("memberDTO = " + memberDTO);
        model.addAttribute("memberDTO", memberDTO);
        return "documents/certificateOfEmployment";
    }
}
