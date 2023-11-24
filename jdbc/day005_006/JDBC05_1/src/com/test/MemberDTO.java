/* ======================================
	MemberDTO.java
	- 데이터 보관 및 전송 전용 클래스
========================================*/
package com.test;

public class MemberDTO
{
	// 주요 속성 구성
	private int empId, cityId, buseoId, jikwiId, basicpay, sudang, minBasicPay;
	private String emp_name, ibsadate, ssn, tel;
	private String cityName, buseoName, jikwiName;
	
	// getter / setter
	public int getEmpId()
	{
		return empId;
	}
	public void setEmpId(int empId)
	{
		this.empId = empId;
	}
	public int getCityId()
	{
		return cityId;
	}
	public void setCityId(int cityId)
	{
		this.cityId = cityId;
	}
	public int getBuseoId()
	{
		return buseoId;
	}
	public void setBuseoId(int buseoId)
	{
		this.buseoId = buseoId;
	}
	public int getJikwiId()
	{
		return jikwiId;
	}
	public void setJikwiId(int jikwiId)
	{
		this.jikwiId = jikwiId;
	}
	public int getBasicpay()
	{
		return basicpay;
	}
	public void setBasicpay(int basicpay)
	{
		this.basicpay = basicpay;
	}
	public int getSudang()
	{
		return sudang;
	}
	public void setSudang(int sudang)
	{
		this.sudang = sudang;
	}
	public String getEmp_name()
	{
		return emp_name;
	}
	public void setEmp_name(String emp_name)
	{
		this.emp_name = emp_name;
	}
	public String getIbsadate()
	{
		return ibsadate;
	}
	public void setIbsadate(String ibsadate)
	{
		this.ibsadate = ibsadate;
	}
	public String getSsn()
	{
		return ssn;
	}
	public void setSsn(String ssn)
	{
		this.ssn = ssn;
	}
	public String getTel()
	{
		return tel;
	}
	public void setTel(String tel)
	{
		this.tel = tel;
	}
	public String getCityName()
	{
		return cityName;
	}
	public void setCityName(String cityName)
	{
		this.cityName = cityName;
	}
	public String getBuseoName()
	{
		return buseoName;
	}
	public void setBuseoName(String buseoName)
	{
		this.buseoName = buseoName;
	}
	public String getJikwiName()
	{
		return jikwiName;
	}
	public void setJikwiName(String jikwiName)
	{
		this.jikwiName = jikwiName;
	}
	public int getMinBasicPay()
	{
		return minBasicPay;
	}
	public void setMinBasicPay(int minBasicPay)
	{
		this.minBasicPay = minBasicPay;
	}
	@Override
	public String toString()
	{
		String result = String.format("%6d %6s %12s %10s %6s %10s %6s %6s %6d %6d %6d", 
				empId, emp_name, ssn, ibsadate, cityName, tel, buseoName, jikwiName, basicpay, sudang, basicpay+sudang);
		return result;
	}
	
	
	
	
}
