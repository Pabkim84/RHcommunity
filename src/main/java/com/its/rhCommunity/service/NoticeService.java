package com.its.rhCommunity.service;

import com.its.rhCommunity.dto.NoticeDTO;
import com.its.rhCommunity.dto.PageDTO;
import com.its.rhCommunity.repository.NoticeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NoticeService {

    @Autowired
    private NoticeRepository noticeRepository;
    public void save(NoticeDTO noticeDTO) throws IOException {
        LocalDateTime date = LocalDateTime.now();
        String dateTime = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        noticeDTO.setNoticeCreatedDateTime(dateTime);

        MultipartFile noticeFile = noticeDTO.getNoticeFile();
        String noticeFileName = noticeFile.getOriginalFilename();
        noticeFileName = System.currentTimeMillis() + "-" + noticeFileName;
        String savePath="C:\\/springboot_img/\\" + noticeFileName;

        if (!noticeFile.isEmpty()) {
            noticeDTO.setNoticeFileName(noticeFileName);
            noticeFile.transferTo(new File(savePath));
        }
        noticeRepository.save(noticeDTO);
    }
    private static final int PAGE_LIMIT = 10;
    private static final int BLOCK_LIMIT = 10;
    public List<NoticeDTO> findAll(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<NoticeDTO> pagingList = noticeRepository.findAll(pagingParam);
        return pagingList;
    }
    public PageDTO paging(int page) {
        int noticeCount = noticeRepository.noticeCount();
        int maxPage = (int)(Math.ceil((double) noticeCount / PAGE_LIMIT));
        int startPage = (((int)(Math.ceil((double) page / BLOCK_LIMIT)))-1) * BLOCK_LIMIT + 1;
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage){
            endPage = maxPage;
        }

        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);

        return paging;
    }

    public NoticeDTO findById(Long id) {

        return noticeRepository.findById(id);
    }

    public void update(NoticeDTO noticeDTO) throws IOException {
        System.out.println("noticeDTO = " + noticeDTO);
        MultipartFile noticeFile = noticeDTO.getNoticeFile();
        String noticeFileName = noticeFile.getOriginalFilename();
        noticeFileName = System.currentTimeMillis() + "-" + noticeFileName;
        String savePath="C:\\/springboot_img/\\" + noticeFileName;

        if (!noticeFile.isEmpty()) {
            noticeDTO.setNoticeFileName(noticeFileName);
            noticeFile.transferTo(new File(savePath));
        } else {
            NoticeDTO findNotice = noticeRepository.findById(noticeDTO.getId());
            noticeDTO.setNoticeFileName(findNotice.getNoticeFileName());
        }
        noticeRepository.update(noticeDTO);
    }

    public void updateHits(Long id) {
        noticeRepository.updateHits(id);
    }
}
