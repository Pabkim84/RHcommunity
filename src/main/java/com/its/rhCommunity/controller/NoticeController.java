package com.its.rhCommunity.controller;

import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.dto.NoticeDTO;
import com.its.rhCommunity.dto.PageDTO;
import com.its.rhCommunity.service.MemberService;
import com.its.rhCommunity.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private MemberService memberService;

    @GetMapping("/paging")
    public String findAll(@RequestParam (value = "page", required=false, defaultValue = "1") int page, Model model) {
        List<NoticeDTO> noticeList = noticeService.findAll(page);
        PageDTO paging = noticeService.paging(page);
        model.addAttribute("paging", paging);
        model.addAttribute("noticeList", noticeList);
        return "notices/notice";
    }
    @GetMapping("/save-form")
    public String saveForm(HttpSession session, Model model) {
        Long id = (Long) session.getAttribute("id");
        noticeService.updateHits(id);
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "notices/save";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute NoticeDTO noticeDTO) throws IOException {
        noticeService.save(noticeDTO);
        return "redirect:/notice/paging";
    }

    @GetMapping("/findById")
    public String findById(@RequestParam Long id, Model model) {
        System.out.println("================NoticeController/findById/id================="+id);
        NoticeDTO noticeDTO = noticeService.findById(id);
        model.addAttribute("notice", noticeDTO);
        return "notices/detail";
    }

    @GetMapping("/update")
    public String update(@RequestParam Long id, Model model) {
        NoticeDTO noticeDTO = noticeService.findById(id);
        model.addAttribute("noticeDTO", noticeDTO);
        return "notices/update";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute NoticeDTO noticeDTO) throws IOException {
        noticeService.update(noticeDTO);
        return "redirect:/notice/findById?id="+noticeDTO.getId();
    }
}
