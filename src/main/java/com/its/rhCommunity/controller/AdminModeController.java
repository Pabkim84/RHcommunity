package com.its.rhCommunity.controller;

import com.its.rhCommunity.dto.*;
import com.its.rhCommunity.service.AnnualHolidayService;
import com.its.rhCommunity.service.AttendanceService;
import com.its.rhCommunity.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/adminMode")
public class AdminModeController {
    @Autowired
    MemberService memberService;
    @Autowired
    AttendanceService attendanceService;
    @Autowired
    AnnualHolidayService annualHolidayService;
    @GetMapping("/AttendanceOfMonth")
    public String findAllByMonth(Model model){
        List<AttendanceAdminDTO> attendanceAdminList = attendanceService.findAllByMonth();
        Integer totalLateTime = attendanceService.totalLateTime();
        Integer totalEarlyTime = attendanceService.totalEarlyTime();
        Integer overTime = attendanceService.overTime();
        model.addAttribute("totalLateTime", totalLateTime);
        model.addAttribute("totalEarlyTime", totalEarlyTime);
        model.addAttribute("overTime", overTime);
        model.addAttribute("attAdminList", attendanceAdminList);
        return "attendance/detailOfMonth";
    }
    @GetMapping("annualHolidayList")
    public String annualHolidayList(@RequestParam int month,  Model model) {
        List<HolidayAdminDTO> annualHolidayDTO = annualHolidayService.findAllByMonth(month);
        model.addAttribute("holidayList", annualHolidayDTO);
        return "annualHoliday/annualHolidayList";
    }
}



//사원목록 근태관리 휴가관리 급여지출 급여관리 서류발급서비스

