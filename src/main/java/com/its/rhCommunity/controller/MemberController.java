package com.its.rhCommunity.controller;

import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.service.AttendanceService;
import com.its.rhCommunity.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@RequestMapping("/member")
@Controller
public class
MemberController {
    @Autowired
    private MemberService memberService;
    @GetMapping("/main")
    public String main(Model model, HttpSession session, Long id){
        id = (Long) session.getAttribute("id");
        MemberDTO memberDTO = memberService.findById(id);
        List<MemberDTO> newMemberList = memberService.findNew();
        model.addAttribute("newList", newMemberList);
        model.addAttribute("loginDTO", memberDTO);
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
        memberDTO.setMemberMobile(firstNum+memberMobile);
        memberService.save(memberDTO);
        return "member/login";
    }
    @GetMapping("/login")
    public String login() {
        return "/member/login";
    }
    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model) {
        MemberDTO loginDTO = memberService.login(memberDTO);
        if(loginDTO!=null){
            List<MemberDTO> newMemberList = memberService.findNew();
            model.addAttribute("newList", newMemberList);
            model.addAttribute("loginDTO", loginDTO);
            session.setAttribute("loginId", loginDTO.getMemberId());
            session.setAttribute("id", loginDTO.getId());
            return "/member/main";
        } else {
            return "/member/login";
        }
    }
    @GetMapping("/myProfile")
    public String myProfile(HttpSession session, Model model){
        Long id = (Long) session.getAttribute("id");
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("memberDTO", memberDTO);
        return "/member/myPage";
    }
    @GetMapping("/memberList")
    public String findAll(Model model){
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "member/memberList";
    }
    @GetMapping("/detail")
    public String findById(@RequestParam Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("memberDTO", memberDTO);
        return "/member/detail";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam Long id){
        memberService.delete(id);
        return "redirect:/member/memberList";
    }
    @GetMapping("/pwCheck")
    public String pwCheck(@RequestParam Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("memberDTO", memberDTO);
        return "/member/pwCheck";
    }
    @PostMapping("/pwCheck")
    public String pwCheck1(@RequestParam Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("memberDTO", memberDTO);
    return "/member/update";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO)throws IOException{
        memberService.update(memberDTO);
        return "redirect:/member/myProfile";
    }
}
