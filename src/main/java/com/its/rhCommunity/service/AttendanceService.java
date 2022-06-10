package com.its.rhCommunity.service;

import com.its.rhCommunity.dto.AttendanceDTO;
import com.its.rhCommunity.dto.MemberDTO;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@Service
public class AttendanceService {
    public AttendanceDTO save(MemberDTO memberDTO) throws ParseException {
//오늘날짜 yyyy-MM-dd로 생성
        String dateTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));

//yyyy-MM-dd 포맷 설정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

//비교할 date와 today를 데이터 포맷으로 변경
        Date date = new Date(dateFormat.parse(vo.getPrgm_edate()).getTime());
        Date today = new Date(dateFormat.parse(dateTime).getTime());

//compareTo메서드를 통한 날짜비교
        int compare = date.compareTo(today);

//조건문
        if(compare > 0) {
            System.out.println("date가 today보다 큽니다.(date > today)");
        }else if(compare < 0) {
            System.out.println("today가 date보다 큽니다.(date < today)");
        }else {
            System.out.println("today와 date가 같습니다.(date = today)");
        }


    }
}
