package com.its.rhCommunity.repository;

import com.its.rhCommunity.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void save(MemberDTO memberDTO) {
        int result = sql.insert("Member.save", memberDTO);
        System.out.println("result = " + result);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }

    public List<MemberDTO> findAll() {
       return sql.selectList("Member.findAll");
    }

    public void delete(Long id) {
        sql.delete("Member.delete", id);
    }

    public MemberDTO findById(Long id) {
        return sql.selectOne("Member.findById", id);
    }

    public void update(MemberDTO memberDTO) throws IOException {
        sql.update("Member.update", memberDTO);
    }
    public List<MemberDTO> findNew() {
       return sql.selectList("Member.findNew");
    }

    public List<MemberDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Member.pagingList", pagingParam);
    }

    public int memberCount() {
        return sql.selectOne("Member.count");
    }

    public MemberDTO findByMemberId(String memberId) {
        System.out.println("=============memberRepository/findByMemberId=============");
        return sql.selectOne("Member.findByMemberId", memberId);
    }

    public List<MemberDTO> findByName(String memberName) {
        return sql.selectList("Member.findByName", memberName);
    }

}
