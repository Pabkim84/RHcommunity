package com.its.rhCommunity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
    private Long id;
    private String memberId;
    private String memberPassword;
    private String memberName;
    private String memberDept;
    private String memberPosition;
    private Timestamp memberJoinDate;
    private String memberIdNum;
    private String memberBirthDay;
    private String memberAddress;
    private String memberEmail;
    private String memberMobile;
    private MultipartFile memberProfile;
    private String memberProfileName;
    private String firstNum;
    private int salary;
    private String educationLv;
    private String career;
    private String certificate;
    private int countAttendance;
    private int countAbsenceDate;
    private int countLate;
    private int countEarly;
    private int totalHoliday;
    private int usedHoliday;
    private int restHoliday;
}
