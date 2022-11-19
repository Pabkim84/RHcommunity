package com.its.rhCommunity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RequestBoardDTO {
    private Long id;
    private String numId;
    private String memberName;
    private String memberDept;
    private String memberPosition;
    private String title;
    private String contents;
    private String createdDate;
    private int hits;
    private String fileName;
    private MultipartFile file;
}
