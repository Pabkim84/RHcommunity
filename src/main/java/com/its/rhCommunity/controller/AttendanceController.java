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

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.List;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {
    @Autowired
    private AttendanceService attendanceService;
    @Autowired
    private MemberService memberService;
    @GetMapping("/attendance")
    public String attendance(@RequestParam Long id, Model model) throws ParseException {
        MemberDTO memberDTO= memberService.findById(id);
        List<AttendanceDTO> attendanceDTOList = attendanceService.save(memberDTO);
        model.addAttribute("attendanceList", attendanceDTOList);
        return "/attendance/save";
    }
    @GetMapping("/findAll")
    public String findAll(Model model, HttpSession session){
        Long id = (Long) session.getAttribute("id");
        List<AttendanceDTO> attendanceDTOList = attendanceService.findAll(id);
        model.addAttribute("attendanceList", attendanceDTOList);
        return "/attendance/save";
    }
    @GetMapping("/closing")
    public String closing (@RequestParam Long id, Model model) throws ParseException {
        MemberDTO memberDTO= memberService.findById(id);
        List<AttendanceDTO> attendanceDTOList = attendanceService.update(memberDTO);
       model.addAttribute("attendanceList", attendanceDTOList);
        return "/attendance/save";
    }

}
