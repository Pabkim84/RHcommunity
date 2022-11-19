package com.its.rhCommunity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.YearMonth;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttendanceAdminDTO {
    private Long id;
    private Long numId;
    private String memberName;
    private String memberDept;
    private String memberPosition;
    private YearMonth adminDate;
    private Integer countStandardDate;
    private Integer countAttendanceDate;
    private Integer countAbsenceDate;
    private Integer totalWorkedTime;
    private Integer avgWorkedTime;;
    private Integer totalLateTime;
    private Integer totalEarlyTime;
}
