package com.its.rhCommunity.controller;

import com.its.rhCommunity.service.AnnualHolidayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/annualHoliday")
public class AnnualHolidayController {
    @Autowired
    private AnnualHolidayService annualHolidayService;
    @GetMapping("/save")
    public String save(){
        return "/annualHoliday/test";
    }
}
