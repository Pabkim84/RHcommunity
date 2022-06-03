package com.its.rhCommunity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttendanceDTO {
    private Long id;
    private Long numId;
    private String memberName;
    private String memberDept;
    private String memberPosition;
    private String selectContents;
    private String period;
    private String contentsDate;
    private int amount;
    private String note;
}
