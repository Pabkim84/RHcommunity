package com.its.rhCommunity.dto;

import lombok.Data;

@Data
public class HolidayAdminDTO {
    private Long id;
    private Long numId;
    private String memberName;
    private String memberDept;
    private String memberPosition;
    private String holidayDate;
    private int totalVacations;
    private int usedVacations;
    private int restVacations;
    private String memberEmail;
    private String memberMobile;
}
