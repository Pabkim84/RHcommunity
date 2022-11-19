package com.its.rhCommunity.controller;

import com.its.rhCommunity.dto.AttendanceDTO;
import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.service.AttendanceService;
import com.its.rhCommunity.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
    public String attendance(@RequestParam(value = "id") Long id) throws ParseException {
        MemberDTO memberDTO= memberService.findById(id);
        attendanceService.save(memberDTO);
        return "redirect:/attendance/findAll";
    }
    @GetMapping("/findAll")
    public String findAll(Model model, HttpSession session){
        Long id = (Long) session.getAttribute("id");
        List<AttendanceDTO> attendanceDTOList = attendanceService.findAll(id);
        MemberDTO memberDTO = memberService.findById(id);
        Integer totalWorkedTime = attendanceService.totalWorkedTime(id);
        Integer avgWorkedTime = attendanceService.avgWorkedTime(id);
        Integer overTime = attendanceService.overTime(id);
        Integer totalLateCount = attendanceService.totalLateCount(id);
        Integer totalLateTime = attendanceService.totalLateTime(id);
        Integer totalEarlyCount = attendanceService.totalEarlyCount(id);
        Integer totalEarlyTime = attendanceService.totalEarlyTime(id);
        Integer totalAbsenceCount = attendanceService.totalAbsenceCount(id);
        model.addAttribute("totalWorkedTime", totalWorkedTime);
        model.addAttribute("avgWorkedTime", avgWorkedTime);
        model.addAttribute("overTime", overTime);
        model.addAttribute("totalLateCount", totalLateCount);
        model.addAttribute("totalLateTime", totalLateTime);
        model.addAttribute("totalEarlyCount", totalEarlyCount);
        model.addAttribute("totalEarlyTime", totalEarlyTime);
        model.addAttribute("totalAbsenceCount", totalAbsenceCount);
        model.addAttribute("memberDTO", memberDTO);
        model.addAttribute("attendanceList", attendanceDTOList);
        return "attendance/detail";
    }
    @GetMapping("/closing")
    public String closing (@RequestParam Long id, Model model) throws ParseException {
        MemberDTO memberDTO= memberService.findById(id);
        List<AttendanceDTO> attendanceDTOList = attendanceService.update(memberDTO);
       model.addAttribute("attendanceList", attendanceDTOList);
        return "attendance/detail";
    }
}
