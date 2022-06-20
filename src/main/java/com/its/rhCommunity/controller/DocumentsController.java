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
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("memberDTO", memberDTO);
        return "documents/certificateOfEmployment";
    }
    @GetMapping("/payStub")
    public String paystub(HttpSession session, Model model){
        Long id = (Long) session.getAttribute("id");
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("memberDTO", memberDTO);
        return "/documents/payStub";
    }
    @GetMapping("/absence-form")
    public String absenceForm(HttpSession session, Model model){
        Long id = (Long) session.getAttribute("id");
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("memberDTO", memberDTO);
        return "/documents/absenceForm";
    }
    @GetMapping("/hollyDay-form")
    public String hollyDayForm(HttpSession session, Model model){
        Long id = (Long) session.getAttribute("id");
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("memberDTO", memberDTO);
        return "/documents/hollyDayForm";
    }
}
