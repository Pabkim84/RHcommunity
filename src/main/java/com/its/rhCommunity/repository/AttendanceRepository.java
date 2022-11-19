package com.its.rhCommunity.repository;

import com.its.rhCommunity.dto.AttendanceAdminDTO;
import com.its.rhCommunity.dto.AttendanceDTO;
import com.its.rhCommunity.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.text.ParseException;
import java.time.LocalDate;
import java.util.List;

@Repository
public class AttendanceRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void save(AttendanceDTO attendanceDTO) {
        sql.insert("Attendance.save", attendanceDTO);
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
    }
    public AttendanceDTO findByLastDay(Long id) {
        return sql.selectOne("Attendance.findByLastDay", id);
    }

    public Integer totalWorkedTime(Long id) {
        return sql.selectOne("Attendance.totalWorkedTime", id);
    }

    public Integer avgWorkedTime(Long id) {
        return sql.selectOne("Attendance.avgWorkedTime", id);
    }

    public Integer overTime(Long id) {
        return sql.selectOne("Attendance.overTime", id);
    }

    public Integer totalLateCount(Long id) {
        return sql.selectOne("Attendance.totalLateCount", id);
    }

    public Integer totalLateTime(Long id) {
        return sql.selectOne("Attendance.totalLateTime", id);
    }

    public Integer totalEarlyCount(Long id) {
        return sql.selectOne("Attendance.totalEarlyCount", id);
    }

    public Integer totalEarlyTime(Long id) {
        return sql.selectOne("Attendance.totalEarlyTime", id);
    }
    public Integer totalAbsenceCount(Long id) {
        return sql.selectOne("Attendance.totalAbsenceCount", id);
    }

    public List<AttendanceAdminDTO> findAllByMonth() {
        return sql.selectList("Attendance.findAllByMonth");
    }
    public Integer totalLateTime() {
        return sql.selectOne("Attendance.findTotalLateTime");
    }
    public Integer totalEarlyTime() {
        return sql.selectOne("Attendance.findTotalEarlyTime");
    }
    public Integer overTime() {
        return sql.selectOne("Attendance.findOverTime");
    }

}
