package com.its.rhCommunity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RequestBoardDTO {
    private Long id;
    private String writerId;
    private String dept;
    private String position;
    private String title;
    private String contents;
    private Timestamp createdDate;
    private int hits;
    private String fileName;
    private MultipartFile file;
}
