package com.its.rhCommunity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReserveDateTimeDTO {
    Long id;
    String numId;
    String memberName;
    String memberDept;
    String memberPosition;
    String title;
    LocalDate reserveDate;
    String dT1;
    String dT2;
    String dT3;
    String dT4;
    String dT5;
    String dT6;
}
