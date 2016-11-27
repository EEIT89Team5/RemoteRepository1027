package com.member.controller;

public class EEE {

	public static void main(String[] args) {
		String m_phone="0988977866";
		String m_phoneReg = "09[0-9]{8}";
		if (m_phone.matches(m_phoneReg)) {
			System.out.println("yes");
		} else{
			System.out.println("no");
		}
	}

}
