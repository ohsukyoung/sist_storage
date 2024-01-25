/* ==================================================
	#03 GradeDTO.java
	- 데이터베이스 전송 객체 자료형 클래스(DTO)
	  성적 데이터 저장 및 전송
=====================================================*/
package com.test.mybatis;

/*
CREATE TABLE TBL_GRADE
( SID   NUMBER
, SUB1  NUMBER(3)
, SUB2  NUMBER(3)
, SUB3  NUMBER(3)
, CONSTRAINT GRADE_SID_PK PRIMARY KEY(SID)
, CONSTRAINT GRADE_SID_FK FOREIGN KEY(SID)
             REFERENCES TBL_STUDENT(SID)
, CONSTRAINT GRADE_SUB1_CK CHECK(SUB1 BETWEEN 0 AND 100)
, CONSTRAINT GRADE_SUB2_CK CHECK(SUB2 BETWEEN 0 AND 100)
, CONSTRAINT GRADE_SUB3_CK CHECK(SUB3 BETWEEN 0 AND 100)
);

SELECT SID, NAME, SUB1, SUB2, SUB3, TOT, AVG, CH
FROM GRADEVIEW
ORDER BY SID;
*/
public class GradeDTO
{
	// 주요 속성 구성
	private String sid, name, ch;		//-- 번호, 이름, 합격/불합격
	private int sub1, sub2, sub3, tot;	//-- 성적1, 성적2, 성적3, 합계
	private double avg;					//-- 평균
	
	// 사용자 정의 생성자 정의 안함
	// → default 생성자 자동 삽입
	
	// getter / setter 구성
	public String getSid()
	{
		return sid;
	}
	public void setSid(String sid)
	{
		this.sid = sid;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getCh()
	{
		return ch;
	}
	public void setCh(String ch)
	{
		this.ch = ch;
	}
	public int getSub1()
	{
		return sub1;
	}
	public void setSub1(int sub1)
	{
		this.sub1 = sub1;
	}
	public int getSub2()
	{
		return sub2;
	}
	public void setSub2(int sub2)
	{
		this.sub2 = sub2;
	}
	public int getSub3()
	{
		return sub3;
	}
	public void setSub3(int sub3)
	{
		this.sub3 = sub3;
	}
	public int getTot()
	{
		return tot;
	}
	public void setTot(int tot)
	{
		this.tot = tot;
	}
	public double getAvg()
	{
		return avg;
	}
	public void setAvg(double avg)
	{
		this.avg = avg;
	}	
	
}
