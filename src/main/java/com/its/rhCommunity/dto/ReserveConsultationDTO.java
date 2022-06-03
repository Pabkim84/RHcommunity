package com.its.rhCommunity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReserveConsultationDTO {
    private Long id;
    private String memberId;
    private String memberName;
    private String memberDept;
    private String memberPosition;
    private String contents;
    private String reservationDate;
    private Timestamp createdDate;
}
