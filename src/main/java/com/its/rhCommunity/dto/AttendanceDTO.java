package com.its.rhCommunity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttendanceDTO {
    private Long id;
    private Long numId;
    private String memberName;
    private String memberDept;
    private String memberPosition;
    private Timestamp memberJoinDate;
    private String attendanceDate;
    private String absenceDate;
    private Timestamp earlyLateDate;
    private float earlyLateTime;
    private float overTime;
    private int countAttendance;
    private int countAbsenceDate;
}
