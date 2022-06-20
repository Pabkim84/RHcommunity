package com.its.rhCommunity.controller;

import com.its.rhCommunity.dto.ReserveDateTimeDTO;
import com.its.rhCommunity.service.ReserveConsultationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequestMapping("/reserveConsultation")
public class ReserveConsultationController {
    @Autowired
    private ReserveConsultationService reserveConsultationService;

    @GetMapping("/reservationList")
    public String findAll(Model model){
        reserveConsultationService.save();
        List<ReserveDateTimeDTO> reservationList = reserveConsultationService.findAll();
        model.addAttribute("reservationList", reservationList);
        return "reserveConsultation/reservationList";
    }
    @GetMapping("/update")
    public String updateDT(@RequestParam String rDate, @RequestParam String dT, HttpSession session){
        String loginId = (String)session.getAttribute("loginId");
        LocalDate reserveDate = LocalDate.parse(rDate, DateTimeFormatter.ISO_DATE);
        ReserveDateTimeDTO reserveDateTimeDTO = new ReserveDateTimeDTO();
        reserveDateTimeDTO.setReserveDate(reserveDate);
        if(dT.equals("dT1")){
            reserveDateTimeDTO.setDT1(loginId);
            reserveConsultationService.update1(reserveDateTimeDTO);
        } else if(dT.equals("dT2")){
            reserveDateTimeDTO.setDT2(loginId);
            reserveConsultationService.update2(reserveDateTimeDTO);

        } else if(dT.equals("dT3")){
            reserveDateTimeDTO.setDT3(loginId);
            reserveConsultationService.update3(reserveDateTimeDTO);

        } else if(dT.equals("dT4")){
            reserveDateTimeDTO.setDT4(loginId);
            reserveConsultationService.update4(reserveDateTimeDTO);

        } else if(dT.equals("dT5")){
            reserveDateTimeDTO.setDT5(loginId);
            reserveConsultationService.update5(reserveDateTimeDTO);

        } else if(dT.equals("dT6")){
            reserveDateTimeDTO.setDT6(loginId);
            reserveConsultationService.update6(reserveDateTimeDTO);
        }
        return "redirect:/reserveConsultation/reservationList";
    }


}
