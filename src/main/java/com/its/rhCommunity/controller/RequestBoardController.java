package com.its.rhCommunity.controller;

import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.dto.NoticeDTO;
import com.its.rhCommunity.dto.PageDTO;
import com.its.rhCommunity.dto.RequestBoardDTO;
import com.its.rhCommunity.service.MemberService;
import com.its.rhCommunity.service.RequestBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/requestBoard")
public class RequestBoardController {
    @Autowired
    private RequestBoardService requestBoardService;
    @Autowired
    private MemberService memberService;
//    @GetMapping("/findAll")
//    public String findAll(Model model){
//        List<RequestBoardDTO> boardList = requestBoardService.findAll();
//        model.addAttribute("boardList", boardList);
//        System.out.println("boardList = " + boardList);
//        return "/requestBoard/requestBoardList";
//    }
    @GetMapping("/save")
    public String save(HttpSession session, Model model){
        Long id = (Long) session.getAttribute("id");
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("memberDTO", memberDTO);
        return "/requestBoard/save";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute RequestBoardDTO requestBoardDTO) throws IOException {
        requestBoardService.save(requestBoardDTO);
        return "redirect:/requestBoard/paging";
    }
    @GetMapping("/findById")
    public String findById(@RequestParam Long id, Model model){
        requestBoardService.updateHits(id);
        RequestBoardDTO requestBoardDTO = requestBoardService.findById(id);
        model.addAttribute("boardDTO", requestBoardDTO);
        return "requestBoard/detail";
    }
    @GetMapping("/update-form")
    public String update(@RequestParam Long id, Model model){
        RequestBoardDTO requestBoardDTO = requestBoardService.findById(id);
        model.addAttribute("boardDTO", requestBoardDTO);
        return "/requestBoard/update";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute RequestBoardDTO requestBoardDTO) throws IOException {
        requestBoardService.update(requestBoardDTO);
        return "redirect:/requestBoard/findById?id="+requestBoardDTO.getId();
    }
    @GetMapping("/delete")
    public String delete(@RequestParam Long id){
        requestBoardService.delete(id);
        return "redirect:/requestBoard/paging";
    }
    @GetMapping("/paging")
    public String findAll(@RequestParam (value = "page", required=false, defaultValue = "1") int page, Model model) {
        List<RequestBoardDTO> requestBoardDTOList = requestBoardService.findAll(page);
        PageDTO paging = requestBoardService.paging(page);
        model.addAttribute("paging", paging);
        model.addAttribute("boardList", requestBoardDTOList);
        return "requestBoard/requestBoardList";
    }
}
