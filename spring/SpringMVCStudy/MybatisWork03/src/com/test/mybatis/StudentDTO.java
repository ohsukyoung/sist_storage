/* ==================================================
	#02 StudentDTO.java
	- 데이터베이스 전송 객체 자료형 클래스(DTO)
	  학생 데이터 저장 및 전송
=====================================================*/
package com.test.mybatis;

/*
CREATE TABLE TBL_STUDENT
( SID   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(40)
, CONSTRAINT STUDENT_SID_PK PRIMARY KEY(SID)
);

SELECT SID, NAME, TEL, SUB
FROM STUDENTVIEW
ORDER BY SID;
*/
public class StudentDTO
{
	// 주요 속성 구성
	private String sid, name, tel;	//-- 번호, 이름, 전화번호
	private int sub;				//-- 삭제 가능 여부

	// 사용자 정의 생성자 정의 안함
	// → default 생성자 자동 삽입

	// getter / setter
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
	public String getTel()
	{
		return tel;
	}
	public void setTel(String tel)
	{
		this.tel = tel;
	}
	public int getSub()
	{
		return sub;
	}
	public void setSub(int sub)
	{
		this.sub = sub;
	}
	
	
}
