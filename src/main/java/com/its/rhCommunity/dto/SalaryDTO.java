package com.its.rhCommunity.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SalaryDTO {
    private Long id;
    private Long numId;
    private String memberName;
    private String memberDept;
    private String memberPosition;
    private String salary;
    private String payDay;
    private String baseSalary;
    private String nationalPension;
    private String positionAllowance;
    private String healthInsurance;
    private String holidayAllowance;
    private String longTermCareInsurance;
    private String mealAllowance;
    private String employmentInsurance;
    private String vacationPay;
    private String incomeTax;
    private String bonus;
    private String localIncomeTax;
    private String etcPay1;
    private String etcPay2;
    private String etcDeduction1;
    private String etcDeduction2;
    private String actualPayment;
    private String totalExtraPay;
    private String totalDeduction;
}
