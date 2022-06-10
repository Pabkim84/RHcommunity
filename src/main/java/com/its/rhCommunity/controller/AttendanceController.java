package com.its.rhCommunity.controller;

import com.its.rhCommunity.dto.AttendanceDTO;
import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.service.AttendanceService;
import com.its.rhCommunity.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {
    @Autowired
    private AttendanceService attendanceService;
    @Autowired
    private MemberService memberService;
    @GetMapping("/attendance")
    public String attendance(@RequestParam Long id, Model model){
        MemberDTO memberDTO= memberService.findById(id);
        AttendanceDTO attendanceDTO = attendanceService.save(memberDTO);
        model.addAttribute("memberDTO", memberDTO);
        return "/attendance/save";
    }
}
