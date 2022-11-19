package com.its.rhCommunity.repository;

import com.its.rhCommunity.dto.SalaryDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class SalaryRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public SalaryDTO findByIdAndPayDay(SalaryDTO salaryDTO) {

        return sql.selectOne("Salary.findByIdAndPayDay", salaryDTO);
    }
    public List<SalaryDTO> findAllById(Long id) {
        return sql.selectList("Salary.findAllById", id);
    }

    public void save(SalaryDTO salaryDTO) {
        System.out.println("-----------------point3 = " + salaryDTO);
        sql.insert("Salary.save", salaryDTO);
    }

    public void update(SalaryDTO salaryDTO) {
        sql.update("Salary.update", salaryDTO);
    }

    public SalaryDTO findPayDayById(SalaryDTO salaryDTO) {
        return sql.selectOne("Salary.findPayDayById", salaryDTO);
    }

    public List<SalaryDTO> findAll() {
        return sql.selectList("Salary.findAll");
    }

    public List<String> findAllPayDays() {

        List<String> payDayList =sql.selectList("Salary.findAllPayDays");
        return payDayList;
    }

    public List<SalaryDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Salary.pagingList", pagingParam);

    }

    public int salaryCount() {
        return sql.selectOne("Salary.count");
    }

    public List<SalaryDTO> findAllByPayYear(String payYear) {
        return sql.selectList("Salary.findAllByPayYear", payYear);
    }

    public SalaryDTO findLastPayById(Long numId) {
       return sql.selectOne("Salary.findLastPayById", numId);
    }
}
