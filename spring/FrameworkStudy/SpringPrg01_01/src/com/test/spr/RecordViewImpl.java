package com.test.spr;

import java.util.Scanner;

public class RecordViewImpl implements RecordView
{
	private Record record;
	
	@Override
	public void setRecord(Record record)
	{
		this.record = record;
	}

	@Override
	public void input()
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.print("국어 영어 수학 점수(공백구분): ");
		String kor = sc.next();
		String eng = sc.next();
		String mat = sc.next();
		
		record.setKor(Integer.parseInt(kor));
		record.setEng(Integer.parseInt(eng));
		record.setMat(Integer.parseInt(mat));
		
		sc.close();
	}

	@Override
	public void output()
	{
		System.out.println("국어 영어 수학 총점 평균");
		System.out.printf("%6d %6d %6d %6d %.1f",record.getKor(), record.getEng(), record.getMat(), record.getTotal(), record.getAvg());
		
	}
	
}
