package com.syd.spring.aop.impl;


import java.util.Arrays;
import java.util.List;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {

	@Before("execution(public int com.syd.spring.aop.impl.AtithmeticCalculatorImp.*(int, int))")
	public void beforeMethod(JoinPoint joinPoint){
		String methdoName = joinPoint.getSignature().getName();
		List<Object> args = Arrays.asList(joinPoint.getArgs());
		
		System.out.println("beforemethod 方法调用前 Name "+methdoName + "|" + args);
	}
	@After("execution(public int com.syd.spring.aop.impl.AtithmeticCalculatorImp.*(int, int))")
	public void afterMethod(JoinPoint jp){
		String methdoName = jp.getSignature().getName();
		System.out.println(methdoName+"方法被调用之后print");
	}
	@AfterReturning("execution(public int com.syd.spring.aop.impl.AtithmeticCalculatorImp.*(int, int))")
	public void afterReturningMethod(JoinPoint jp){
		String methdoName = jp.getSignature().getName();
		System.out.println(methdoName+"方法正确调用之后print");
	}
	@AfterThrowing(value="execution(public int com.syd.spring.aop.impl.AtithmeticCalculatorImp.*(int, int))",
			 throwing="e")
	public void afterThrowingMethod(JoinPoint jp, Exception e){
		String methdoName = jp.getSignature().getName();
		System.out.println(methdoName+"方法出异常之后print||" + e);
	}
	
	@Around(value = "execution(public int com.syd.spring.aop.impl.AtithmeticCalculatorImp.*(int, int))")
	public Object aroundMethod (ProceedingJoinPoint pjp){
		System.out.println(pjp);
		return 100;
	}
}
