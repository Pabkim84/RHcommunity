package com.its.rhCommunity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/documents")

public class DocumentsController {
    @GetMapping("/certificate")
    public String certificate(){
        return "/documents/certificateOfEmployment";
    }
}