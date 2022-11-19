package com.its.rhCommunity.service;

import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.dto.PageDTO;
import com.its.rhCommunity.repository.MemberRepository;
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
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;
    public void save(MemberDTO memberDTO) throws IOException {

        MultipartFile memberProfile = memberDTO.getMemberProfile();
        String memberProfileName = memberProfile.getOriginalFilename();
        memberProfileName = System.currentTimeMillis() + "-" + memberProfileName;
        memberDTO.setMemberProfileName(memberProfileName);
        String savePath="C:\\/springboot_img/\\" + memberProfileName;
        if (!memberProfile.isEmpty()) {
            memberProfile.transferTo(new File(savePath));
        }
        memberRepository.save(memberDTO);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return memberRepository.login(memberDTO);
    }

    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    public void delete(Long id) {
        memberRepository.delete(id);
    }

    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }

    public void update(MemberDTO memberDTO) throws IOException{
        MultipartFile memberProfile = memberDTO.getMemberProfile();
        String memberProfileName = memberProfile.getOriginalFilename();
        memberProfileName = System.currentTimeMillis() + "-" + memberProfileName;
        String savePath="C:\\/springboot_img/\\" + memberProfileName;
        if (!memberProfile.isEmpty()) {
            memberProfile.transferTo(new File(savePath));
            memberDTO.setMemberProfileName(memberProfileName);
        } else {
            memberProfileName = memberRepository.findById(memberDTO.getId()).getMemberProfileName();
            memberDTO.setMemberProfileName(memberProfileName);
        }
        memberRepository.update(memberDTO);
        memberRepository.findById(memberDTO.getId());
    }

    public List<MemberDTO> findNew() {
        return memberRepository.findNew();

    }
    private static final int PAGE_LIMIT = 10; // 한 페이지에 보여줄 글 갯수
    private static final int BLOCK_LIMIT = 3; // 보여줄 필요 페이지 수
    public List<MemberDTO> pagingList(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<MemberDTO> pagingList = memberRepository.pagingList(pagingParam);
        return pagingList;
    }
    public PageDTO paging(int page) {
        int boardCount = memberRepository.memberCount(); // 글 갯수 조회
        int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT)); // 필요한 전체 페이지 갯수(소숫점 올림)
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1; // 시작페이지 1 4 7 10
        int endPage = startPage + BLOCK_LIMIT - 1; // 끝페이지 3 6 9 12
        if(endPage > maxPage) {
            endPage = maxPage;// end페이지가 필요페이지보다 크면 end페이지를 필요페이지와 동일하게 한다.
        }
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }


    public MemberDTO findByMemberId(String memberId) {
        System.out.println("=============memberService/findByMemberId=============");
        return memberRepository.findByMemberId(memberId);
    }


    public List<MemberDTO> findByName(String memberName) {
        return memberRepository.findByName(memberName);
    }
}
