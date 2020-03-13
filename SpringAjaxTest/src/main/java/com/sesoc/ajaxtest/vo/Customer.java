package com.sesoc.ajaxtest.vo;

import java.util.ArrayList;

public class Customer {

	private String custId;
	private String custPw;
	private int custAge;
	private boolean custFlag;
	private ArrayList<String> custArray;

	public Customer() {
	}

	public Customer(String custId, String custPw, int custAge, boolean custFlag, ArrayList<String> custArray) {
		this.custId = custId;
		this.custPw = custPw;
		this.custAge = custAge;
		this.custFlag = custFlag;
		this.custArray = custArray;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getCustPw() {
		return custPw;
	}

	public void setCustPw(String custPw) {
		this.custPw = custPw;
	}

	public int getCustAge() {
		return custAge;
	}

	public void setCustAge(int custAge) {
		this.custAge = custAge;
	}

	public boolean isCustFlag() {
		return custFlag;
	}

	public void setCustFlag(boolean custFlag) {
		this.custFlag = custFlag;
	}

	public ArrayList<String> getCustArray() {
		return custArray;
	}

	public void setCustArray(ArrayList<String> custArray) {
		this.custArray = custArray;
	}

	@Override
	public String toString() {
		return "Customer [custId=" + custId + ", custPw=" + custPw + ", custAge=" + custAge + ", custFlag=" + custFlag
				+ ", custArray=" + custArray + "]";
	}

}
