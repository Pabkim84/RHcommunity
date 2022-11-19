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
    private String btnId;
    private String holidayDate;
    private int totalVacations;
    private int usedVacations;
    private int restVacations;
}
