package com.its.rhCommunity.service;

import com.its.rhCommunity.dto.ReserveDateTimeDTO;
import com.its.rhCommunity.repository.ReserveConsultationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class ReserveConsultationService {
    @Autowired
    ReserveConsultationRepository reserveConsultationRepository;
    public void save() {
        ReserveDateTimeDTO reservationDTO = new ReserveDateTimeDTO();
        LocalDate nowDate = LocalDate.now();
        for(int i=0; i<=13; i++){
            LocalDate newNowDate = nowDate.plusDays(i);
            DayOfWeek dayOfWeek = newNowDate.getDayOfWeek();
            int dateDateNum = dayOfWeek.getValue();
            if(dateDateNum!=6 && dateDateNum!=7) {
                reservationDTO.setReserveDate(newNowDate);
                ReserveDateTimeDTO dupleCheckDTO = reserveConsultationRepository.findByDate(newNowDate);
                if (dupleCheckDTO == null) {
                    reserveConsultationRepository.save(reservationDTO);
                }
            }
        }
    }
    public List<ReserveDateTimeDTO> findAll(){
        return reserveConsultationRepository.findAll();
    }
    public void update1(ReserveDateTimeDTO reserveDateTimeDTO) {
        reserveConsultationRepository.update1(reserveDateTimeDTO);
    }
    public void update2(ReserveDateTimeDTO reserveDateTimeDTO) {
        reserveConsultationRepository.update2(reserveDateTimeDTO);
    }

    public void update3(ReserveDateTimeDTO reserveDateTimeDTO) {
        reserveConsultationRepository.update3(reserveDateTimeDTO);
    }

    public void update4(ReserveDateTimeDTO reserveDateTimeDTO) {
        reserveConsultationRepository.update4(reserveDateTimeDTO);
    }

    public void update5(ReserveDateTimeDTO reserveDateTimeDTO) {
        reserveConsultationRepository.update5(reserveDateTimeDTO);
    }

    public void update6(ReserveDateTimeDTO reserveDateTimeDTO) {
        reserveConsultationRepository.update6(reserveDateTimeDTO);
    }
}
