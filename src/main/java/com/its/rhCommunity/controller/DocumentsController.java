package com.its.rhCommunity.controller;

import com.google.gson.Gson;
import com.its.rhCommunity.dto.AnnualHolidayDTO;
import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.dto.SalaryDTO;
import com.its.rhCommunity.service.AnnualHolidayService;
import com.its.rhCommunity.service.MemberService;
import com.its.rhCommunity.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/documents")

public class DocumentsController {
    @Autowired
    MemberService memberService;
    @Autowired
    SalaryService salaryService;
    @Autowired
    AnnualHolidayService holidayService;
    @GetMapping("/showDocuments")
    public String documents(Model model) {
        List<MemberDTO> memberDTOList =memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "documents/documentsList";
    }
    @GetMapping(value = "/findByName", produces = "application/text; charset=UTF-8")
    public @ResponseBody String findByName (@RequestParam String memberName){
        System.out.println("memberName = " + memberName);
        List<MemberDTO> memberDTOList = memberService.findByName(memberName);
        String json = new Gson().toJson(memberDTOList);
        System.out.println("json = " + json);
        return json;
    }
    @GetMapping("/certificate")
    public String certificate(@RequestParam Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("memberDTO", memberDTO);
        return "documents/certificateOfEmployment";
    }
    @GetMapping("/payStub")
    public String payStub(@RequestParam("id") Long id, @RequestParam("subOption") int month, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        Calendar cal = Calendar.getInstance();
        LocalDate localDate = LocalDate.now();
        String findMonth = String.valueOf(month);
        if(month<10){
            findMonth = "0"+findMonth;
        }
        cal.set(localDate.getYear(), month-1, 1);
        int dayOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        String payDay = localDate.getYear()+"-"+findMonth+"-"+dayOfMonth;
        System.out.println("payDay = " + payDay);
        SalaryDTO salaryDTO = new SalaryDTO();
        salaryDTO.setNumId(id);
        salaryDTO.setPayDay(payDay);
        SalaryDTO findSalaryDTO = salaryService.findPayDayById(salaryDTO);
        System.out.println("findSalaryDTO = " + findSalaryDTO);
        model.addAttribute("memberDTO", memberDTO);
        model.addAttribute("salaryDTO", findSalaryDTO);
        return "/documents/payStub";
    }
    @GetMapping("/absence-form")
    public String absenceForm(@RequestParam Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("memberDTO", memberDTO);
        return "/documents/absenceForm";
    }
    @GetMapping("/holiday-form")
    public String holidayForm(@RequestParam Long id, Model model) throws Exception {
        System.out.println("DocumentsController id========"+ id);
        MemberDTO memberDTO = memberService.findById(id);
        System.out.println("DocumentsController========memberDTO = " + memberDTO);
        AnnualHolidayDTO holidayDTO = holidayService.findLastDateByNumId(id);

//        AnnualHolidayDTO annualHolidayDTO = new AnnualHolidayDTO();
//        annualHolidayDTO.setHolidayDate("2022-11-15");
//        annualHolidayDTO.setId(1L);
//        annualHolidayDTO.setNumId(1L);
//        annualHolidayDTO.setTotalVacations(15);
//        annualHolidayDTO.setUsedVacations(3);
//        annualHolidayDTO.setRestVacations(12);

        model.addAttribute("memberDTO", memberDTO);
        model.addAttribute("holidayDTO", holidayDTO);

        return "documents/holidayForm";
    }

}
