package com.its.rhCommunity.controller;

import com.its.rhCommunity.dto.AnnualHolidayDTO;
import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.service.AnnualHolidayService;
import com.its.rhCommunity.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

import java.sql.Array;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/annualHoliday")
public class AnnualHolidayController {
    @Autowired
    private AnnualHolidayService annualHolidayService;
    @Autowired
    private MemberService memberService;
    @GetMapping("/save-form")
    public String save(HttpSession session, Model model){
        System.out.println("pass");
        Long id = (Long)session.getAttribute("id");
        MemberDTO memberDTO = memberService.findById(id);
        LocalDate memberJoinDate = LocalDate.parse(memberDTO.getMemberJoinDate());
        int startYear = memberJoinDate.getYear();
        int startDay = memberJoinDate.getDayOfYear();
        int endYear = LocalDate.now().getYear();
        int endDay= LocalDate.now().getDayOfYear();
        int diffYear = endYear-startYear;
        int diffDay = endDay-startDay;
        System.out.println("endYear ="+endYear+"/endDay ="+endDay);
        System.out.println("startYear ="+startYear+"/startDay ="+startDay);
        System.out.println("diffYear ="+diffYear+"/diffDay ="+diffDay);
        int totalVacations = 0;
        if(diffYear>0 && diffYear<3){ totalVacations = 15;
        } else if(diffYear>3&&diffYear<5){ totalVacations = 16;
        } else if(diffYear>5&&diffYear<7){ totalVacations = 17;
        } else if(diffYear>7&&diffYear<9){ totalVacations = 18;
        } else if(diffYear>9&&diffYear<11){ totalVacations = 19;
        } else if(diffYear>11&&diffYear<13){ totalVacations = 20;
        } else if(diffYear>13&&diffYear<15){ totalVacations = 21;
        } else if(diffYear>15&&diffYear<17){ totalVacations = 22;
        } else if(diffYear>17&&diffYear<19){ totalVacations = 23;
        } else if(diffYear>19&&diffYear<21){ totalVacations = 24;
        } else if(diffYear>21){ totalVacations = 25;}
        model.addAttribute("totalVacations", totalVacations);
        int usedVacations = annualHolidayService.countDays(id);
        model.addAttribute("usedVacations", usedVacations);
        int restVacations = totalVacations - usedVacations;
        model.addAttribute("restVacations", restVacations);
        List<AnnualHolidayDTO> holidayDTOList = annualHolidayService.findByNumId(id);
//        List<String> holidayDateList = new ArrayList<>();
//        for (AnnualHolidayDTO holiday: holidayDTOList) {
//            holidayDateList.add((String) holiday.getHolidayDate());
//        }
        model.addAttribute("holidayList", holidayDTOList);
        System.out.println(holidayDTOList);
        return "annualHoliday/save";
    }

    @PostMapping("/save")
    public @ResponseBody List<String> save(@RequestParam(value = "holidayArray[]") List<String> holidayArray,
                                     @RequestParam(value = "btnId[]") List<String> btnIdArray,
                                     @RequestParam(value = "totalVacations") int totalVacations,
                                     HttpSession session,
                                           Model model)throws Exception{
//        System.out.println("ok1");
        Long id = (Long)session.getAttribute("id");
        MemberDTO memberDTO = memberService.findById(id);
//        System.out.println("ok2");
        annualHolidayService.save(memberDTO, holidayArray, btnIdArray, totalVacations);
//        System.out.println("ok3");
        List<AnnualHolidayDTO> holidayDTOList = annualHolidayService.findByNumId(id);
        List<String> arr = new ArrayList<>();
        for(AnnualHolidayDTO holidayDTO: holidayDTOList) {
            arr.add(holidayDTO.getHolidayDate());
        }
//        System.out.println("holidayDTOList = " + holidayDTOList);
//        System.out.println("arr = "+arr);
        model.addAttribute("holidayList", holidayDTOList);
        return arr;
    }

}

