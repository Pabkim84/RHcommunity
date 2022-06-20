package com.its.rhCommunity.service;

import com.its.rhCommunity.dto.AttendanceDTO;
import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.repository.AttendanceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;


@Service
public class AttendanceService {
    @Autowired
    private AttendanceRepository attendanceRepository;

    public List<AttendanceDTO> save(MemberDTO memberDTO) throws ParseException {
        LocalDateTime dateTime = LocalDateTime.now();
        LocalTime time = LocalTime.now();
        LocalTime regTime = LocalTime.of(9, 00, 00);
        String attendanceDate = dateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        String absenceDate = dateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        AttendanceDTO attendanceDTO = new AttendanceDTO();
        attendanceDTO.setNumId(memberDTO.getId());
        attendanceDTO.setMemberName(memberDTO.getMemberName());
        attendanceDTO.setMemberDept(memberDTO.getMemberDept());
        attendanceDTO.setMemberPosition(memberDTO.getMemberPosition());
        attendanceDTO.setMemberJoinDate(memberDTO.getMemberJoinDate());
        AttendanceDTO dupleCheck = attendanceRepository.dupleCheck(attendanceDTO);
        if (dupleCheck == null) {
            if (time.isBefore(regTime)) {
                attendanceDTO.setAttendanceDate(attendanceDate);
                memberDTO.setCountAttendance(memberDTO.getCountAttendance() + 1);
            } else {
                attendanceDTO.setAttendanceDate(attendanceDate);
                memberDTO.setCountAttendance(memberDTO.getCountAttendance() + 1);
                attendanceDTO.setLateDate(attendanceDate);
                if (attendanceDTO.getLateDate() == null) {
                    attendanceDTO.setAbsenceDate(absenceDate);
                    memberDTO.setCountAbsenceDate(memberDTO.getCountAbsenceDate() + 1);
                } else {
                    memberDTO.setCountLate(memberDTO.getCountLate() + 1);
                }
            }
            attendanceRepository.save(attendanceDTO, memberDTO);
        }
        return attendanceRepository.attendanceDTOList(attendanceDTO);
    }

    public List<AttendanceDTO> findAll(Long id) {
        return attendanceRepository.findAll(id);
    }
    public List<AttendanceDTO> update(MemberDTO memberDTO) throws ParseException{
        AttendanceDTO attendanceDTO = attendanceRepository.dupleCheck2(memberDTO.getId());
        if (attendanceDTO.getClosingDate() == null) {
            LocalDateTime dateTime = LocalDateTime.now();
            String closingDate = dateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            LocalTime time = LocalTime.now();
            LocalTime regTime = LocalTime.of(18, 00, 00);
            if(time.isAfter(regTime)){
                attendanceDTO.setClosingDate(closingDate);
            } else {
                attendanceDTO.setClosingDate(closingDate);
                attendanceDTO.setEarlyDate(closingDate);
                memberDTO.setCountEarly(memberDTO.getCountEarly() + 1);
            }
            attendanceRepository.update(attendanceDTO, memberDTO);
        }
        return attendanceRepository.findAll(attendanceDTO.getNumId());
    }

}
