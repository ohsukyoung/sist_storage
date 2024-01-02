// MemberDTO.java

package com.test;

public class MemberDTO
{
	String name, tel, add;
	
	public MemberDTO()
	{}

	public MemberDTO(String name, String tel, String add)
	{
		this.name = name;
		this.tel = tel;
		this.add = add;
	}
	
	// getter, setter
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

	public String getAddr()
	{
		return add;
	}

	public void setAddr(String add)
	{
		this.add = add;
	}
	
	
}
