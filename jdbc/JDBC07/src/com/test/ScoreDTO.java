package com.test;

public class ScoreDTO
{
	private String name, sid;
	private int kor, eng, mat, tot, rank;
	private double avg;
	
	// getter / setter
	
	public String getName()
	{
		return name;
	}
	public int getRank()
	{
		return rank;
	}
	public void setRank(int rank)
	{
		this.rank = rank;
	}
	public String getSid()
	{
		return sid;
	}
	public void setSid(String sid)
	{
		this.sid = sid;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getKor()
	{
		return kor;
	}
	public void setKor(int kor)
	{
		this.kor = kor;
	}
	public int getEng()
	{
		return eng;
	}
	public void setEng(int eng)
	{
		this.eng = eng;
	}
	public int getMat()
	{
		return mat;
	}
	public void setMat(int mat)
	{
		this.mat = mat;
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
