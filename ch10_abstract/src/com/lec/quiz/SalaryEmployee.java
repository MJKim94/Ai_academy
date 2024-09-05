package com.lec.quiz;
// name, annalSalary, computePay(abstract),computeIncentive(flnal)
public class SalaryEmployee extends Employee {
	private int annualSalary;

	public SalaryEmployee(String Name, int annualSalary) {
		super(Name);
		this.annualSalary = annualSalary;
	}

	@Override
	public int computePay() {
		// TODO Auto-generated method stub
		return annualSalary / 14 ;
	}
	
}
