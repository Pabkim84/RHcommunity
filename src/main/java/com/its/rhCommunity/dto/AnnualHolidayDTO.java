package com.its.rhCommunity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AnnualHolidayDTO {
    private Long id;
    private Long numId;
    private String memberName;
    private String memberDept;
    private String memberPosition;
    private String selectContents;
    private int totalVacation;
    private int usedVacations;
    private int restVacations;
}
