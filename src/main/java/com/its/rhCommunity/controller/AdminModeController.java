package com.its.rhCommunity.controller;

import com.its.rhCommunity.dto.AttendanceAdminDTO;
import com.its.rhCommunity.dto.AttendanceDTO;
import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.service.AttendanceService;
import com.its.rhCommunity.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/adminMode")
public class AdminModeController {
    @Autowired
    MemberService memberService;
    @Autowired
    AttendanceService attendanceService;

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
}

// 평균 근무일수
// 평균 결근일수(통계)
// 평균 근무시간(통계)
// 초과 근무시간(통계)
// 평균 지각률(통계)
// 평균 지각시간(통계)
// 평균 조퇴률(통계)
// 평균 조퇴시간(통계)





//사원목록 근태관리 휴가관리 급여지출 급여관리 서류발급서비스

