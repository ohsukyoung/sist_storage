/* ========================================================
	#03. Region
	- 지역 데이터 자료형 클래스(DTO)
=========================================================== */

package com.test.mvc;

public class Region
{
	private String regionId, regionName;	//-- 지역 아이디, 부서이름
	private int delCheck;
	//-- 참조되는 경우 (1 이상) 삭제 불가능.
	//	 그렇지 않은 경우(0)만 삭제 가능.
	
	// getter / setter
	public String getRegionId()
	{
		return regionId;
	}
	public void setRegionId(String regionId)
	{
		this.regionId = regionId;
	}
	public String getRegionName()
	{
		return regionName;
	}
	public void setRegionName(String regionName)
	{
		this.regionName = regionName;
	}
	public int getDelCheck()
	{
		return delCheck;
	}
	public void setDelCheck(int delCheck)
	{
		this.delCheck = delCheck;
	}
	
	
	
}
