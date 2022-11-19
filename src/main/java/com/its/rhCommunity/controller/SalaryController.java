package com.its.rhCommunity.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.google.gson.Gson;
import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.dto.PageDTO;
import com.its.rhCommunity.dto.SalaryDTO;
import com.its.rhCommunity.service.MemberService;
import com.its.rhCommunity.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.*;

@RequestMapping("/salary")
@Controller
public class SalaryController {
    @Autowired
    private SalaryService salaryService;
    @Autowired
    private MemberService memberService;

    @GetMapping("/payment")
    public String payment(Model model, HttpSession session){
        Long numId = (Long) session.getAttribute("id");
        List<MemberDTO> memberDTOList = memberService.findAll();
        SalaryDTO salaryDTO = new SalaryDTO();
        SalaryDTO lastSalary = salaryService.findLastPayById(numId); // 아 시발 널 어떻게해
        if(lastSalary==null) {
            LocalDate localDate = LocalDate.now();
            int dayOfMonth = Calendar.getInstance().getActualMaximum(Calendar.DAY_OF_MONTH);
            String payDay = localDate.getYear()+"-"+localDate.getMonthValue()+"-"+dayOfMonth;
            salaryDTO.setNumId(numId);
            salaryDTO.setSalary(payDay);
            model.addAttribute("salaryDTO", salaryDTO);
        } else {
            model.addAttribute("salaryDTO", lastSalary);
        }
        model.addAttribute("memberList", memberDTOList);
        return "salaries/payment";
    }
//    @GetMapping("/ajaxFindById")
//    public @ResponseBody Map<String, String> findByIdAndPayDay(@RequestParam (value = "id")Long id){
//        System.out.println("-----------------point1 = " + id);
//        LocalDate localDate = LocalDate.now();
//        int dayOfMonth = Calendar.getInstance().getActualMaximum(Calendar.DAY_OF_MONTH);
//        String payDay = localDate.getYear()+"-"+localDate.getMonthValue()+"-"+dayOfMonth;
//        SalaryDTO sampleDTO = new SalaryDTO();
//        sampleDTO.setNumId(id);
//        sampleDTO.setPayDay(payDay);
////        Map<String, String> salaryMap = salaryService.findAllById(sampleDTO);
//        System.out.println("-----------------point6 = " + salaryMap);
//        return salaryMap;
//    }
    @RequestMapping("/save")
    public @ResponseBody String save(@RequestParam Map<String, Object> parameters) throws IOException {
        System.out.println("=======================================|||||||||||성공|||||||||||==========================");
        System.out.println(parameters);
        String json = parameters.get("paramList").toString();
        System.out.println("=======================json"+json);

        ObjectMapper mapper = new ObjectMapper();
        List<Map<String, Object>> paramList = mapper.readValue(json, new TypeReference<ArrayList<Map<String, Object>>>(){});
        salaryService.save(paramList);
        return "ok";
    }
//    @GetMapping("/salaryList")
//    public String findAll(Model model){
//        List<SalaryDTO> salaryDTOList = salaryService.findAll();
////        JSONArray list = salaryService.findAllPayDays();
////        System.out.println(list);
////        model.addAttribute("jsonList", list);
//        model.addAttribute("salaryList", salaryDTOList);
//        return "test2";
//    }
    @GetMapping("/paging")
    public String paging(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model) {
        System.out.println("======SalaryController/paging/page======"+page);
        PageDTO paging = salaryService.paging(page);
        System.out.println("======SalaryController/paging/paging======"+paging);
        List<SalaryDTO> salaryDTOList = salaryService.pagingList(page);
//        JSONArray list = salaryService.findAllPayDays();
        List<String> payDayList = salaryService.findAllPayDays();
        System.out.println(payDayList);
        model.addAttribute("payDayList", payDayList);
        model.addAttribute("salaryList", salaryDTOList);
        model.addAttribute("paging", paging);
        return "salaries/salaryPagingList";
    }
    @GetMapping(value = "/ajaxList", produces = "application/text; charset=UTF-8")
    public @ResponseBody String ajaxList (@RequestParam String payYear){
        System.out.println("payYear = " + payYear);
        List<SalaryDTO> salaryDTOList = salaryService.findAllByPayYear(payYear);
        System.out.println("salaryDTOList = " + salaryDTOList);
        String json = new Gson().toJson(salaryDTOList);
        System.out.println("제이슨 결과2 = " + json);
        return json;
    }
}
