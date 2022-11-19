package com.its.rhCommunity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
    private Long id;
    private MultipartFile memberProfile;
    private String memberProfileName;
    private String memberId;
    private String memberPassword;
    private String memberName;
    private String groupNo;
    private String memberGroup;
    private String memberJoinDate;
    private String deptNo;
    private String memberDept;
    private String memberTeam;
    private String memberDuty;
    private String memberPosition;
    private String salary;
    private String stockOption;
    private String contractOption;
    private String memberIdNum;
    private String memberBirthDay;
    private String gender;
    private String health;
    private String maritalStatus;
    private String memberEmail;
    private String impairment;
    private String levImpairment;
    private String memberMobile;
    private String memberAddress;
    private String hobby;
    private String specialty;
    private String religion;
    private String education1;
    private String education2;
    private String career1;
    private String career2;
    private String career3;
    private String license;

}
