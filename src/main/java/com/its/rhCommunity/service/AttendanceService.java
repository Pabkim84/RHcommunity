package com.its.rhCommunity.service;

import com.its.rhCommunity.dto.AttendanceAdminDTO;
import com.its.rhCommunity.dto.AttendanceDTO;
import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.repository.AttendanceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.*;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.text.ParseException;
import java.time.format.DateTimeFormatter;



@Service
public class AttendanceService {
    @Autowired
    private AttendanceRepository attendanceRepository;
    @Autowired
    private MemberService memberService;
    public void save(MemberDTO memberDTO) throws ParseException {
        AttendanceDTO attendanceDTO = new AttendanceDTO();
        LocalDateTime date= LocalDateTime.now();
        LocalDate today= LocalDate.now();
        String absenceDate = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//        LocalDate lastDay = attendanceRepository.findByLastDay(memberDTO.getId()).getToday();
//        System.out.println("===================lastDay===================="+lastDay);
//        long days = ChronoUnit.DAYS.between(lastDay, today);
//        System.out.println("===================days===================="+days);
//        int difDays = (int) days;
//        System.out.println("===================difDays===================="+difDays);
//        for(int i = 1; i < difDays; i++){
//            LocalDate missingDate = today.minusDays(i);
//            System.out.println("===================missingDate===================="+missingDate);
//            DayOfWeek dayOfWeek = missingDate.getDayOfWeek();
//            int day = dayOfWeek.getValue();
//            System.out.println("===================day===================="+day);
//            if(day !=6 & day !=7) {
//                AttendanceDTO absenceDTO = new AttendanceDTO();
//                absenceDTO.setNumId(memberDTO.getId());
//                absenceDTO.setMemberName(memberDTO.getMemberName());
//                absenceDTO.setMemberDept(memberDTO.getMemberDept());
//                absenceDTO.setMemberPosition(memberDTO.getMemberPosition());
//                absenceDTO.setMemberJoinDate(memberDTO.getMemberJoinDate());
//                absenceDTO.setToday(today);
//                absenceDTO.setAbsenceDate(absenceDate);
//                attendanceRepository.save(absenceDTO, memberDTO);
//            }
//        }
        LocalTime time = LocalTime.now();
        LocalTime regTime = LocalTime.of(9, 00, 00);
        String attendanceTime = date.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
        long diffHours = regTime.until(time, ChronoUnit.HOURS);
        long diffMinutes = regTime.until(time, ChronoUnit.MINUTES);
        Integer lateTime = (int)diffMinutes;
        attendanceDTO.setNumId(memberDTO.getId());
        attendanceDTO.setToday(today);
        AttendanceDTO dupleCheck = attendanceRepository.dupleCheck(attendanceDTO);
        System.out.println("===================dupleCheck===================="+dupleCheck);
        if (dupleCheck == null) {
            if (time.isBefore(regTime)) {
                attendanceDTO.setAttendanceTime(attendanceTime);
//                memberDTO.setCountAttendance(memberDTO.getCountAttendance() + 1);
            } else {
                attendanceDTO.setAttendanceTime(attendanceTime);
//                memberDTO.setCountAttendance(memberDTO.getCountAttendance() + 1);
                attendanceDTO.setLateTime(lateTime);
//                if (attendanceDTO.getLateTime() != null) {
//                    memberDTO.setCountLate(memberDTO.getCountLate() + 1);
//                }
            }
            attendanceRepository.save(attendanceDTO);
        }
    }

    public List<AttendanceDTO> findAll(Long id) {
        return attendanceRepository.findAll(id);
    }
    public List<AttendanceDTO> update(MemberDTO memberDTO) throws ParseException{
        AttendanceDTO attendanceDTO = attendanceRepository.dupleCheck2(memberDTO.getId());
        System.out.println("==================attendanceDTO==================="+attendanceDTO);

        if (attendanceDTO.getClosingTime() == null) {
            LocalDateTime dateTime = LocalDateTime.now();
            String closingTime = dateTime.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
            System.out.println("==================closingDate==================="+closingTime);

            LocalTime time = LocalTime.now();
            LocalTime regTime = LocalTime.of(18, 00, 00);
            long diffHours = regTime.until(time, ChronoUnit.HOURS);
            long diffMinutes = regTime.until(time, ChronoUnit.MINUTES);
            Integer earlyTime = (int)diffMinutes;
            Integer workedTime = (int) time.until(LocalTime.parse(attendanceDTO.getAttendanceTime(),DateTimeFormatter.ofPattern("HH:mm:ss")), ChronoUnit.HOURS);
            Integer overTime=0;
            if(diffHours<0){
                overTime = Math.abs((int)diffHours);
            }
            if(time.isAfter(regTime)){
                attendanceDTO.setClosingTime(closingTime);
                attendanceDTO.setWorkedTime(workedTime);
                attendanceDTO.setOverTime(overTime);

            } else {
                attendanceDTO.setClosingTime(closingTime);
                attendanceDTO.setWorkedTime(workedTime);
                attendanceDTO.setEarlyTime(earlyTime);
            }
            attendanceRepository.update(attendanceDTO, memberDTO);
            System.out.println("==================attendanceDTO==================="+attendanceDTO);

        }
        System.out.println("==================attendanceDTO.getNumId()==================="+attendanceDTO.getNumId());
        return attendanceRepository.findAll(attendanceDTO.getNumId());
    }

    public Integer totalWorkedTime(Long id) {
        Integer result = attendanceRepository.totalWorkedTime(id);
        if(result==null){
            result =0;
        }
        return result;
    }

    public Integer avgWorkedTime(Long id) {
        Integer result = attendanceRepository.avgWorkedTime(id);
        if(result==null){
            result =0;
        }
        return result;
    }

    public Integer overTime(Long id) {
        Integer result = attendanceRepository.overTime(id);
        if(result==null){
            result =0;
        }
        return result;
    }

    public Integer totalLateCount(Long id) {
        Integer result = attendanceRepository.totalLateCount(id);
        if(result==null){
            result =0;
        }
        return result;
    }

    public Integer totalLateTime(Long id) {
        Integer result = attendanceRepository.totalLateTime(id);
        if(result==null){
            result =0;
        }
        return result;
    }

    public Integer totalEarlyCount(Long id) {
        Integer result = attendanceRepository.totalEarlyCount(id);
        if(result==null){
            result =0;
        }
        return result;
    }

    public Integer totalEarlyTime(Long id) {
        Integer result = attendanceRepository.totalEarlyTime(id);
        if(result==null){
            result =0;
        }
        return result;
    }

    public List<AttendanceAdminDTO> findAllByMonth() {
        List<AttendanceAdminDTO> attendanceAdminList = attendanceRepository.findAllByMonth();
        System.out.println("=========AttendanceService/findAllByMonth/attendanceAdminList=====P1====="+attendanceAdminList);
        List<MemberDTO> memberDTOList = memberService.findAll();
        Calendar cal = Calendar.getInstance();
        LocalDate localDate = LocalDate.now();
        YearMonth adminDate = YearMonth.now();
        int weekdayOfMonth = 0;
        for(int i = 1; i<=localDate.lengthOfMonth(); i++) {
            cal.set(localDate.getYear(), localDate.getMonthValue(), i);
            int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
            if(dayOfWeek!=1&&dayOfWeek!=7){
                weekdayOfMonth+=1;
            }
        }
        Long id=1L;
        for(AttendanceAdminDTO adminDTO: attendanceAdminList){
            for(int i=0; i<memberDTOList.size();i++){
                if(memberDTOList.get(i).getId()==adminDTO.getNumId()){
                    adminDTO.setId(id);
                    adminDTO.setMemberName(memberDTOList.get(i).getMemberName());
                    adminDTO.setMemberDept(memberDTOList.get(i).getMemberDept());
                    adminDTO.setMemberPosition(memberDTOList.get(i).getMemberPosition());
                    adminDTO.setAdminDate(adminDate);
                    adminDTO.setCountStandardDate(weekdayOfMonth);
                }
            }
            id++;
        }
        System.out.println("=========AttendanceService/findAllByMonth/attendanceAdminList=====P2====="+attendanceAdminList);
        return attendanceAdminList;
    }

    public Integer totalAbsenceCount(Long id) {
        return attendanceRepository.totalAbsenceCount(id);
    }
    public Integer totalLateTime() {
        Integer result = attendanceRepository.totalLateTime();
        if(result==null){
            result=0;
        }
        System.out.println("result = " + result);
        return result;
    }
    public Integer totalEarlyTime() {
        Integer result = attendanceRepository.totalEarlyTime();
        if(result==null){
            result=0;
        }
        System.out.println("result = " + result);
        return result;
    }
    public Integer overTime() {
        Integer result = attendanceRepository.overTime();
        if(result==null){
            result=0;
        }
        System.out.println("result = " + result);
        return result;
    }
}
