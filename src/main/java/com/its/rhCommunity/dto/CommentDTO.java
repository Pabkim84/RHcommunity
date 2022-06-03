package com.its.rhCommunity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentDTO {
    private Long Id;
    private Long boardId;
    private String writerId;
    private String commentContents;
    private Timestamp createdDate;
}
