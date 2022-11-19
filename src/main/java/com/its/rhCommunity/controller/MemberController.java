package com.its.rhCommunity.controller;

import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.dto.PageDTO;
import com.its.rhCommunity.service.MemberService;
import com.its.rhCommunity.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.*;

@RequestMapping("/member")
@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private SalaryService salaryService;
    @GetMapping("/main")
    public String main(Model model, HttpSession session){
        Long id = (Long) session.getAttribute("id");
        MemberDTO memberDTO = memberService.findById(id);
        List<MemberDTO> newMemberList = memberService.findNew();
        model.addAttribute("newList", newMemberList);
        model.addAttribute("loginDTO", memberDTO);
        return "member/main";
    }
    @GetMapping("/signUp")
    public String signUp() {
        return "/member/saveForm";
    }
    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO)throws IOException {
        memberService.save(memberDTO);
        System.out.println("memberDTO.getId() = " + memberDTO.getId());
        Long id = memberDTO.getId();
        MemberDTO findLastMember = memberService.findById(id);
        salaryService.saveBaseData(findLastMember);
        return "member/login";
    }
    @GetMapping("/login")
    public String login() {
        return "/member/login";
    }
    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
        MemberDTO loginDTO = memberService.login(memberDTO);
        if(loginDTO!=null){
            session.setAttribute("loginId", loginDTO.getMemberId());
            session.setAttribute("id", loginDTO.getId());
            session.setAttribute("memberName", loginDTO.getMemberName());
            return "redirect:/member/main";
        } else {
            return "member/login";
        }
    }
    @GetMapping("/myProfile")
    public String myProfile(HttpSession session, Model model){
        Long id = (Long) session.getAttribute("id");
        return "redirect:/member/detail?id="+id;
    }
    @GetMapping("/memberList")
    public String findAll(Model model){
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "member/memberList";
    }
    @GetMapping("/detail")
    public String findById(@RequestParam Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("memberDTO", memberDTO);
        return "member/test";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam Long id){
        memberService.delete(id);
        return "redirect:/member/memberList";
    }
    @GetMapping("/pwCheck")
    public String pwCheck(@RequestParam Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("memberDTO", memberDTO);
        return "member/pwCheck";
    }
    @PostMapping("/pwCheck")
    public String pwCheck1(@RequestParam Long id, Model model){
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("memberDTO", memberDTO);
    return "member/testForm";
    }
//    @GetMapping("/update-form")
//    public String updateForm(@RequestParam (value = "id") Long id, Model model){
//        MemberDTO memberDTO = memberService.findById(id);
//        System.out.println("id = " + id);
//        System.out.println("memberDTO = " + memberDTO);
//        model.addAttribute("memberDTO", memberDTO);
//        return "member/testForm";
//    }
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO, Model model)throws IOException{
        memberService.update(memberDTO);
        return "redirect:/member/detail?id="+memberDTO.getId();
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "member/login";
    }
    @GetMapping("/paging")
    public String paging(@RequestParam(value="page", required=false, defaultValue="1") int page,
                         Model model) {
        System.out.println("======MemberController/paging/page======"+page);
        PageDTO paging = memberService.paging(page);
        System.out.println("======MemberController/paging/paging======"+paging);
        List<MemberDTO> memberList = memberService.pagingList(page);

        model.addAttribute("memberList", memberList);
        model.addAttribute("paging", paging);
        return "member/memberList";
    }
    @GetMapping ("/findByMemberId")
    public @ResponseBody Boolean findByMemberId(@RequestParam String memberId){
        System.out.println("=============memberController/findByMemberId=============point1");
        MemberDTO memberDTO = memberService.findByMemberId(memberId);
        System.out.println("=============memberController/findByMemberId=============point2");
        if(memberDTO!=null){
        System.out.println("=============memberController/findByMemberId=============point3");
            return false;
        } else {
        System.out.println("=============memberController/findByMemberId=============point4");
            return true;
        }
    }

//    public void memberMaker(){
//        String[] boysNames = {"민준","서준","도윤","예준","시우","하준","주원","지호","지후","준우","준서","건우","도현","현우","지훈","우진","선우","서진","유준","연우","민재","현준","은우","정우","시윤","승우","승현","준혁","지환","윤우","승민","유찬","지우","이준","민성","준영","시후","진우","수호","지원","수현","재윤","시현","동현","태윤","이안","민규","한결","재원","민우","재민","은찬","윤호","시원","민찬","지안","시온","성민","준호","승준","성현","현서","재현","하율","지한","우빈","태민","지성","예성","민호","태현","지율","서우","민혁","은호","성준","규민","정민","준","지민","윤성","율","윤재","우주","하람","하진","민석","준수","은성","태양","예찬","준희","도훈","하민","준성","건","지완","현수","승원","강민"};
//        String[] girlsNames = {"서연","서윤","지우","서현","하은","하윤","민서","지유","윤서","지민","채원","수아","지아","지윤","은서","다은","예은","수빈","지안","소율","예린","예원","하린","지원","소윤","서아","시은","유나","유진","채은","윤아","가은","서영,""민지","예진","예나","수민","수연","연우","시아","아린","예서","주아","하율","시연","연서","다인","서우","유주","다연","아인","현서","아윤","서은","채윤","하연","서율","서진","유빈,""나윤","지율","나은","수현","예지","다현","서하","소은","나연","지은","민주","사랑","시현","예빈","윤지","지현","소연","채아","혜원","지수","은채","주하","승아","다윤","소민","서희","나현","채린","민아","하영","세아","세은","도연","규리","아영","다온","가윤","지연","예림","태희","민채"};
//        String[] lastNames = {"김", "이", "박", "최", "정", "조", "강", "윤", "장", "임", "한", "전", "권", "신", "송", "오", "서", "황", "고", "양", "문"};
//
//        Map<String, Double> w = new HashMap<String, Double>();
//        w.put("김", 30D);
//        w.put("이", 20D);
//        w.put("박", 11D);
//        w.put("최", 6D);
//        w.put("정", 5.6D);
//        w.put("조", 3.5D);
//        w.put("강", 2.75D);
//        w.put("윤", 2.65D);
//        w.put("장", 2.6D);
//        w.put("임", 2.5D);
//        w.put("한", 1.95D);
//        w.put("전", 1.75D);
//        w.put("권", 1.55D);
//        w.put("신", 1.5D);
//        w.put("송", 1.25D);
//        w.put("오", 1.15D);
//        w.put("서", 1D);
//        w.put("황", 0.95D);
//        w.put("고", 0.85D);
//        w.put("양", 0.75D);
//        w.put("문", 0.7D);
//
//        Random rand = new Random();
//        System.out.println(getWeightedRandom(w, rand));
//    }
//    public static <E> E getWeightedRandom(Map<E, Double> weights, Random random) {
//        E result = null;
//        double bestValue = Double.MAX_VALUE;
//
//        for (E element : weights.keySet()) {
//            double value = -Math.log(random.nextDouble()) / weights.get(element);
//            if (value < bestValue) {
//                bestValue = value;
//                result = element;
//            }
//        }
//        return result;
//    }
}
