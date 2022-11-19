package com.its.rhCommunity.service;

import com.its.rhCommunity.dto.MemberDTO;
import com.its.rhCommunity.dto.PageDTO;
import com.its.rhCommunity.dto.SalaryDTO;
import com.its.rhCommunity.repository.MemberRepository;
import com.its.rhCommunity.repository.SalaryRepository;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.*;

@Service

public class SalaryService {
    @Autowired
    private SalaryRepository salaryRepository;
    @Autowired
    private MemberRepository memberRepository;

    public List<SalaryDTO> findAll(){
        return salaryRepository.findAll();
    }
    public SalaryDTO findPayDayById(SalaryDTO salaryDTO) {
        System.out.println("SalaryService=========point1");
    return salaryRepository.findPayDayById(salaryDTO);

    }
    public void save(List<Map<String, Object>> paramList) throws IOException {
        System.out.println("-----------------point1 = " + paramList);
        LocalDate localDate = LocalDate.now();
        int dayOfMonth = Calendar.getInstance().getActualMaximum(Calendar.DAY_OF_MONTH);
        String payDay = localDate.getYear()+"-"+localDate.getMonthValue()+"-"+dayOfMonth;

        for(int i=0; i<paramList.size(); i++){
            System.out.println(paramList.get(i).get("numId"));
            String id = paramList.get(i).get("numId").toString();
            Long numId = Long.parseLong(id);
            MemberDTO memberDTO = memberRepository.findById(numId);
            SalaryDTO salaryDTO = new SalaryDTO();
//            salaryDTO.setNumId(numId);
//            salaryDTO.setPayDay(payDay);
//            salaryDTO = salaryRepository.findByIdAndPayDay(salaryDTO);
            salaryDTO.setNumId(memberDTO.getId());
            salaryDTO.setMemberName(memberDTO.getMemberName());
            salaryDTO.setMemberDept(memberDTO.getMemberDept());
            salaryDTO.setMemberPosition(memberDTO.getMemberPosition());
            salaryDTO.setSalary(memberDTO.getSalary());
            salaryDTO.setPayDay(payDay);
            System.out.println(paramList.get(i).get("baseSalary"));
            salaryDTO.setBaseSalary(paramList.get(i).get("baseSalary").toString());
            System.out.println(paramList.get(i).get("nationalPension"));
            salaryDTO.setNationalPension(paramList.get(i).get("nationalPension").toString());
            System.out.println(paramList.get(i).get("healthInsurance"));
            salaryDTO.setHealthInsurance(paramList.get(i).get("healthInsurance").toString());
            System.out.println(paramList.get(i).get("employmentInsurance"));
            salaryDTO.setEmploymentInsurance(paramList.get(i).get("employmentInsurance").toString());
            System.out.println(paramList.get(i).get("longTermCareInsurance"));
            salaryDTO.setLongTermCareInsurance(paramList.get(i).get("longTermCareInsurance").toString());
            System.out.println(paramList.get(i).get("incomeTax"));
            salaryDTO.setIncomeTax(paramList.get(i).get("incomeTax").toString());
            System.out.println(paramList.get(i).get("localIncomeTax"));
            salaryDTO.setLocalIncomeTax(paramList.get(i).get("localIncomeTax").toString());
            System.out.println(paramList.get(i).get("positionAllowance"));
            salaryDTO.setPositionAllowance(paramList.get(i).get("positionAllowance").toString());
            System.out.println(paramList.get(i).get("strHolidayAllowance"));
            salaryDTO.setHolidayAllowance(paramList.get(i).get("strHolidayAllowance").toString());
            System.out.println(paramList.get(i).get("strVacationPay"));
            salaryDTO.setVacationPay(paramList.get(i).get("strVacationPay").toString());
            System.out.println(paramList.get(i).get("strMealAllowance"));
            salaryDTO.setMealAllowance(paramList.get(i).get("strMealAllowance").toString());
            System.out.println(paramList.get(i).get("strBonus"));
            salaryDTO.setBonus(paramList.get(i).get("strBonus").toString());
            System.out.println(paramList.get(i).get("etcPay1"));
            salaryDTO.setEtcPay1(paramList.get(i).get("etcPay1").toString());
            System.out.println(paramList.get(i).get("etcPay2"));
            salaryDTO.setEtcPay2(paramList.get(i).get("etcPay2").toString());
            System.out.println(paramList.get(i).get("etcDeduction1"));
            salaryDTO.setEtcDeduction1(paramList.get(i).get("etcDeduction1").toString());
            System.out.println(paramList.get(i).get("etcDeduction2"));
            salaryDTO.setEtcDeduction2(paramList.get(i).get("etcDeduction2").toString());
            System.out.println(paramList.get(i).get("total"));
            salaryDTO.setActualPayment(paramList.get(i).get("total").toString());
            System.out.println(paramList.get(i).get("totalExtraPay"));
            salaryDTO.setTotalExtraPay(paramList.get(i).get("totalExtraPay").toString());
            System.out.println(paramList.get(i).get("totalDeduction"));
            salaryDTO.setTotalDeduction(paramList.get(i).get("totalDeduction").toString());
            System.out.println("-----------------point2 = " + salaryDTO);
            salaryRepository.save(salaryDTO);
        }

//                int dayOfMonth = Calendar.getInstance().getActualMaximum(Calendar.DAY_OF_MONTH);
//                int memberSalary = Integer.parseInt(memberDTO.getSalary());
//                int chargePerDay = memberSalary / 52 / 6;
//                int baseSalary = chargePerDay * dayOfMonth;
//                int nationalPension = baseSalary * 45 / 1000;
//                int healthInsurance = baseSalary * 3495 / 100000;
//                int longTermCareInsurance = healthInsurance * 1227 / 10000;
//                int employmentInsurance = baseSalary * 9 / 1000;
//                System.out.println("=============baseSalary: "+baseSalary+"nationalPension: "+nationalPension+"healthInsurance: "+healthInsurance+"longTermCareInsurance: "+longTermCareInsurance+"employmentInsurance: "+employmentInsurance);
//                int incomeTax = 0;
//                int incomeTaxRate = 0;
//                int deductionTax = 0;
//                int totalInsurance = nationalPension + healthInsurance + employmentInsurance + longTermCareInsurance;
//                if (memberSalary <= 12000000) {
//                    incomeTaxRate = 6;
//                    incomeTax = (memberSalary - deductionTax) * (incomeTaxRate / 100) / 12 - totalInsurance;
//                } else if (memberSalary > 12000000 && memberSalary <= 46000000) {
//                    deductionTax = 1080000;
//                    incomeTaxRate = 15;
//                    incomeTax = (memberSalary - deductionTax) * (incomeTaxRate / 100) / 12 - totalInsurance;
//                } else if (memberSalary > 46000000 && memberSalary <= 88000000) {
//                    deductionTax = 5220000;
//                    incomeTaxRate = 24;
//                    incomeTax = (memberSalary - deductionTax) * (incomeTaxRate / 100) / 12 - totalInsurance;
//                } else if (memberSalary > 88000000 && memberSalary <= 150000000) {
//                    deductionTax = 14900000;
//                    incomeTaxRate = 35;
//                    incomeTax = (memberSalary - deductionTax) * (incomeTaxRate / 100) / 12 - totalInsurance;
//                } else if (memberSalary > 150000000 && memberSalary <= 300000000) {
//                    deductionTax = 19400000;
//                    incomeTaxRate = 38;
//                    incomeTax = (memberSalary - deductionTax) * (incomeTaxRate / 100) / 12 - totalInsurance;
//                } else if (memberSalary > 300000000 && memberSalary <= 500000000) {
//                    deductionTax = 25400000;
//                    incomeTaxRate = 40;
//                    incomeTax = (memberSalary - deductionTax) * (incomeTaxRate / 100) / 12 - totalInsurance;
//                } else if (memberSalary > 500000000 && memberSalary <= 1000000000) {
//                    deductionTax = 35400000;
//                    incomeTaxRate = 42;
//                    incomeTax = (memberSalary - deductionTax) * (incomeTaxRate / 100) / 12 - totalInsurance;
//                } else {
//                    deductionTax = 65400000;
//                    incomeTaxRate = 45;
//                    incomeTax = (memberSalary - deductionTax) * (incomeTaxRate / 100) / 12 - totalInsurance;
//                }
//                DecimalFormat df = new DecimalFormat("###,###");
//                String dfSalary = df.format(memberSalary);
//                String dfBaseSalary = df.format(baseSalary);
//                String df_BaseSalary = df.format(baseSalary);
//                String dfTotalInsurance = df.format(baseSalary);
//                String dfNationalPension = df.format(baseSalary);
//                String dfHealthInsurance = df.format(baseSalary);
//                String dfLongTermCareInsurance = df.format(baseSalary);
//                String dfEmploymentInsurance = df.format(baseSalary);
//                String dfIncomeTax = df.format(baseSalary);
//                int localIncomeTax = incomeTax/10;
//                System.out.println("==========localIncomeTax=========="+localIncomeTax);
//                int totalExtraPay = salaryDTO.getPositionAllowance()+salaryDTO.getHolidayAllowance()+salaryDTO.getMealAllowance()+salaryDTO.getVacationPay()+salaryDTO.getBonus()+salaryDTO.getEtcVal1()+salaryDTO.getEtcVal3();


//                salaryDTO.setMemberName(memberDTO.getMemberName());
//                salaryDTO.setMemberDept(memberDTO.getMemberDept());
//                salaryDTO.setMemberPosition(memberDTO.getMemberPosition());
//                salaryDTO.setSalary(memberDTO.getSalary());
//                salaryDTO.setPayDay(payDay);
//                salaryDTO.setTotalExtraPay(totalExtraPay);
//                salaryDTO.setTotalDeduction(totalDeduction);
//                salaryDTO.setActualPayment(actualPayment);

//                salaryRepository.save(salaryDTO);
//        System.out.println("-----------------point4 = " + salaryDTO);
    }

    public List<String> findAllPayDays() {
//        JSONArray list = new JSONArray();
//        List<String> list = new ArrayList<>();
        List<String>payDayList = salaryRepository.findAllPayDays();
//        for (SalaryDTO salaryDTO: salaryDTOList){
//            LocalDate date = LocalDate.parse(salaryDTO.getPayDay());
//            int optionYear = date.getYear();
//            JSONObject data = new JSONObject();
//            data.put("year", optionYear);
//            list.add(data);
//        }
        return payDayList;
    }
    private static final int PAGE_LIMIT = 10; // 한 페이지에 보여줄 글 갯수
    private static final int BLOCK_LIMIT = 3; // 보여줄 필요 페이지 수
    public List<SalaryDTO> pagingList(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<SalaryDTO> pagingList = salaryRepository.pagingList(pagingParam);
        return pagingList;
    }
    public PageDTO paging(int page) {
        int boardCount = salaryRepository.salaryCount(); // 글 갯수 조회 36
        int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT)); // 필요한 전체 페이지 갯수(소숫점 올림) 36/10=4
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1; // 시작페이지 1 4 7 10 1/3=1*3+1=4
        int endPage = startPage + BLOCK_LIMIT - 1; // 끝페이지 3 6 9 12 4+3-1=6
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

    public List<SalaryDTO> findAllByPayYear(String payYear) {
        return salaryRepository.findAllByPayYear(payYear);
    }

//    public Map<String, String> findAllById(SalaryDTO sampleDTO) {
//        List<SalaryDTO> findList = salaryRepository.findAllById(sampleDTO.getNumId());
//        System.out.println("-----------------point2 = " + findList);
//        if(findList.size()==0){
//            System.out.println("-----------------point2-1");
//            save(sampleDTO);
//        } else {
//            System.out.println("-----------------point2-2 = "+findList);
//
//            for(SalaryDTO salary: findList) {
//                if (!salary.getPayDay().equals(sampleDTO.getPayDay())) {
//                    System.out.println("-----------------point2-3");
//                    save(sampleDTO);
//                }
//            }
//        }
//        Map<String, String> salaryMap = findByIdAndPayDay(sampleDTO);
//        return salaryMap;
//    }
    public SalaryDTO findLastPayById(Long numId){
        return salaryRepository.findLastPayById(numId);
    }

    public void saveBaseData(MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        SalaryDTO salaryDTO = new SalaryDTO();
        salaryDTO.setNumId(memberDTO.getId());
        salaryDTO.setMemberName(memberDTO.getMemberName());
        salaryDTO.setMemberDept(memberDTO.getMemberDept());
        salaryDTO.setMemberPosition(memberDTO.getMemberPosition());
        salaryDTO.setSalary(memberDTO.getSalary());
        LocalDate localDate = LocalDate.now();
        Calendar cal = Calendar.getInstance();
        cal.set(localDate.getYear(), localDate.getMonthValue()-1, 1);
        int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        String payDay = localDate.getYear()+"-"+ localDate.getMonthValue()+"-"+lastDay;
        System.out.println("================SalaryService/saveBaseData/payDay = " + payDay);
        salaryDTO.setPayDay(payDay);
        salaryDTO.setBaseSalary("0");
        salaryDTO.setNationalPension("0");
        salaryDTO.setPositionAllowance("0");
        salaryDTO.setHealthInsurance("0");
        salaryDTO.setHolidayAllowance("0");
        salaryDTO.setLongTermCareInsurance("0");
        salaryDTO.setMealAllowance("0");
        salaryDTO.setEmploymentInsurance("0");
        salaryDTO.setVacationPay("0");
        salaryDTO.setIncomeTax("0");
        salaryDTO.setBonus("0");
        salaryDTO.setLocalIncomeTax("0");
        salaryDTO.setEtcPay1("0");
        salaryDTO.setEtcPay2("0");
        salaryDTO.setEtcDeduction1("0");
        salaryDTO.setEtcDeduction2("0");
        salaryDTO.setActualPayment("0");
        salaryDTO.setTotalExtraPay("0");
        salaryDTO.setTotalDeduction("0");
        salaryRepository.save(salaryDTO);
    }
}
