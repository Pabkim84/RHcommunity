package com.its.rhCommunity.service;
import com.its.rhCommunity.dto.AnnualHolidayDTO;
import com.its.rhCommunity.dto.HolidayAdminDTO;
import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.repository.AnnualHolidayRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.time.LocalDate;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@Service
public class AnnualHolidayService {
    private static final Logger LOGGER = LoggerFactory.getLogger(AnnualHolidayService.class);

    @Autowired
    private AnnualHolidayRepository annualHolidayRepository;
    public void save(MemberDTO memberDTO, List<String> holidayArray, List<String> btnIdArray, int totalVacations) throws ParseException {
        AnnualHolidayDTO annalHolidayDTO = new AnnualHolidayDTO();
        int totalUsedVacations = annualHolidayRepository.countDays(memberDTO.getId());
        int restVacations = totalVacations-totalUsedVacations;
        LocalDate date = LocalDate.now();
        System.out.println("date = " + date);
        int i=0;
        for(String holiday : holidayArray) {
            System.out.println("holiday = " + holiday);
            annalHolidayDTO.setNumId(memberDTO.getId());
            annalHolidayDTO.setBtnId(btnIdArray.get(i));
            annalHolidayDTO.setHolidayDate(holiday);
            annalHolidayDTO.setTotalVacations(totalVacations);
            annalHolidayDTO.setRestVacations(restVacations);
            System.out.println("=============service/btnId==========="+annalHolidayDTO.getBtnId());
            System.out.println(annalHolidayDTO);
            System.out.println("service2");
            annualHolidayRepository.save(annalHolidayDTO);
            i++;
        }

//        for(String btnId : btnIdArray) {
//            annalHolidayDTO.setBtnId(btnId);
//            annualHolidayRepository.save(annalHolidayDTO);
//        }
    }

    public int countDays(Long id) {
        return annualHolidayRepository.countDays(id);
    }

    public List<AnnualHolidayDTO> findByNumId(Long id) {
        return annualHolidayRepository.findByNumId(id);
    }

    public AnnualHolidayDTO findLastDateByNumId(Long id) throws Exception {
        AnnualHolidayDTO findDTO = new AnnualHolidayDTO();

        System.out.println("holidayService========id = "+id);
        findDTO = annualHolidayRepository.findLastDateByNumId(id);
        System.out.println("holidayService========holidayDTO = " + findDTO);
        System.out.println("holidayService========"+annualHolidayRepository.countDays(id));
        int countDays = annualHolidayRepository.countDays(id);
        if(findDTO==null) {
            findDTO.setId(0L);
            findDTO.setNumId(id);
            findDTO.setUsedVacations(0);
            findDTO.setTotalVacations(0);
            findDTO.setRestVacations(0);
        } else {
            findDTO.setUsedVacations(countDays);
            findDTO.setRestVacations(findDTO.getTotalVacations() - findDTO.getUsedVacations());
            System.out.println("holidayService========" + (findDTO.getTotalVacations() - findDTO.getUsedVacations()));
        }
        return findDTO;
    }
    public List<HolidayAdminDTO> findAllByMonth(int month) {
        return annualHolidayRepository.findAllByMonth(month);
    }
}