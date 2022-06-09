package com.its.rhCommunity.service;

import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;
    public void save(MemberDTO memberDTO) throws IOException {
        MultipartFile memberProfile = memberDTO.getMemberProfile();
        String memberProfileName = memberProfile.getOriginalFilename();
        memberProfileName = System.currentTimeMillis() + "-" + memberProfileName;
        memberDTO.setMemberProfileName(memberProfileName);
        String savePath="D:\\spring_img\\" + memberProfileName;
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
        String savePath="D:\\spring_img\\" + memberProfileName;
        if (!memberProfile.isEmpty()) {
            memberProfile.transferTo(new File(savePath));
            memberDTO.setMemberProfileName(memberProfileName);
        }
        memberRepository.update(memberDTO);
    }
}
