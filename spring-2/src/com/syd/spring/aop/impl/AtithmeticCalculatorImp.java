package com.syd.spring.aop.impl;

import org.springframework.stereotype.Component;

@Component
public class AtithmeticCalculatorImp implements AtithmeticCalculator {

	@Override
	public int add(int i, int j) {
		System.out.println("add被调用");
		int re = i + j;
		return re;
	}

	@Override
	public int sub(int i, int j) {
		// TODO Auto-generated method stub
		int re = i - j;
		return re;
	}

	@Override
	public int mul(int i, int j) {
		int re = i * j;
		return re;
	}

	@Override
	public int div(int i, int j) {
		// TODO Auto-generated method stub
		int re = i / j;
		return re;
	}

}
