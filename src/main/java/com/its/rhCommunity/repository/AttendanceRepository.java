package com.its.rhCommunity.repository;

import com.its.rhCommunity.dto.AttendanceDTO;
import com.its.rhCommunity.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.text.ParseException;
import java.util.List;

@Repository
public class AttendanceRepository {
    @Autowired
    SqlSessionTemplate sql;
    public void save(AttendanceDTO attendanceDTO, MemberDTO memberDTO) {
        sql.insert("Attendance.save", attendanceDTO);
        sql.update("Member.update", memberDTO);
    }
    public List<AttendanceDTO> attendanceDTOList (AttendanceDTO attendanceDTO){
        return sql.selectList("Attendance.attendanceList", attendanceDTO);
    }

    public List<AttendanceDTO> findAll(Long id) {
        return sql.selectList("Attendance.findAll", id);
    }

    public AttendanceDTO dupleCheck(AttendanceDTO attendanceDTO) {
      AttendanceDTO dupleCheck = sql.selectOne("Attendance.dupleCheck", attendanceDTO);
        return dupleCheck;
    }
    public AttendanceDTO dupleCheck2(Long id) {
        AttendanceDTO dupleCheck2 = sql.selectOne("Attendance.dupleCheck2", id);
        return dupleCheck2;
    }
    public void update(AttendanceDTO attendanceDTO, MemberDTO memberDTO) throws ParseException {
        sql.update("Attendance.update", attendanceDTO);
        sql.update("Member.update2", memberDTO);
    }
}
