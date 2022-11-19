package com.its.rhCommunity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO {
    private Long id;
    private Long noticeWriterId;
    private String noticeWriter;
    private String noticeTitle;
    private String noticeContents;
    private String noticeCreatedDateTime;
    private int noticeHits;
    private MultipartFile noticeFile;
    private String noticeFileName;
}
