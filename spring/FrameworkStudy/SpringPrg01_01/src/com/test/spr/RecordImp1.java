package com.test.spr;

public class RecordImp1 implements Record
{
	
	private int kor, eng, mat;
	
	@Override
	public void setKor(int kor)
	{
		this.kor = kor;
	}

	@Override
	public int getKor()
	{
		return kor;
	}

	@Override
	public void setEng(int eng)
	{
		this.eng = eng;
	}

	@Override
	public int getEng()
	{
		return eng;
	}

	@Override
	public void setMat(int mat)
	{
		this.mat = mat;
	}

	@Override
	public int getMat()
	{
		return mat;
	}

	@Override
	public int getTotal()
	{
		int result = 0;
		result = this.getKor() + this.getEng() + this.getMat();
		
		return result;
	}

	@Override
	public double getAvg()
	{
		double result = this.getTotal() / 3.0;
		return result;
	}
	
}
