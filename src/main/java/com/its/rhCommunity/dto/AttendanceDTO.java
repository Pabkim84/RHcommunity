package com.its.rhCommunity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttendanceDTO {
    private Long id;
    private Long numId;
    private Integer workedTime;
    private Integer overTime;
    private LocalDate today;
    private String attendanceTime;
    private String closingTime;
    private String absenceDate;
    private Integer lateTime;
    private Integer earlyTime;
}
