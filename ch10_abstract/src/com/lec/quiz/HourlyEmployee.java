package com.lec.quiz;
// name, hoursWorked, moneyPerHour, computePay(),computeIncentive()
// 메인함수

public class HourlyEmployee extends Employee {
	private int hoursWorked;
	private int moneyPerHour;
	public HourlyEmployee(String Name, int hoursWorked, int moneyPerHour) {
		super(Name);
		this.hoursWorked = hoursWorked;
		this.moneyPerHour = moneyPerHour;
	}
	@Override
	public int computePay() {
		return hoursWorked * moneyPerHour;
	}
	

}
