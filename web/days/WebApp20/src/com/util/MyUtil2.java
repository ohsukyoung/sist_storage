/* ======================
	MyUtil.java
	- 게시판 페이징 처리
========================= */

// check~!!!
// 지금 같이 확인해보고자 하는 페이징 처리 기법은
// 다양한 방법들 중 하나(그나마 쉬운 것을 골라...)이다.
// 학습을 마친 이후에... 꼭!!! 추가적으로 개념을 정리하고
// 확장시키고, 다른 방법들도 찾아보고 공부해야한다~!!

package com.util;

public class MyUtil2
{
	// ■ 전체 페이지 수를 구하는 메소드
	public int getpageCount(int 표시할게시물수, int 전체게시물수)
	{
		int pageCount = 0;
		
		pageCount = 전체게시물수 / 표시할게시물수;
		
		if(전체게시물수%표시할게시물수 != 0)
			pageCount++;
		
		return pageCount;
	}
	
	// ■ 페이징 처리 기능의 메소드
	public String pageIndexList(int 현재표시할페이지, int 전체페이지수, String 링크설정URL)
	{
		StringBuffer strList = new StringBuffer();
		
		int numPerBlock = 10;
		
		int currentPageSetup; //currentPageSetup
		
		int page;
		int n;
		
		if(현재표시할페이지 == 0)
			return "";

		if(링크설정URL.indexOf("?") != -1)
		{
			링크설정URL = 링크설정URL + "&";
		} else						
		{
			링크설정URL = 링크설정URL + "?";
		}
		
		/*
		0	: 1  ~ 10
		10	: 11 ~ 20
		20	: 21 ~ 30
		30	: 31 ~ 40
		40	: 41 ~ 50
		*/
		
		currentPageSetup = (현재표시할페이지 / numPerBlock) * numPerBlock;
		
		if(현재표시할페이지 % numPerBlock == 0)
		{
			currentPageSetup = currentPageSetup - numPerBlock;
			// currentPageSetup -= numPerBlock;
		}
		
		// 1 페이지 (맨처음으로)
		if( (전체페이지수>numPerBlock) && (currentPageSetup>0) )
		{
			strList.append(" <a href='"+ 링크설정URL +"pageNum=1'>1</a>");
		}
		
		// Prev(이전으로)
		n = 현재표시할페이지 - numPerBlock;
		
		if( (전체페이지수>numPerBlock) && (currentPageSetup>0) )
		{
			strList.append(" <a href='"+ 링크설정URL +"pageNum="+ n +"'>Prev</a>");
		}
		
		// 각 페이지 바로가기
		page = currentPageSetup + 1;
		//-- 『+1』을 수행하는 이유는
		//	앞에서 currentPageSetup 에서 10을 가져왔다면
		//	10부터 시작하는 것이 아니라
		//	바로가기 페이지는 11부터 시작해야 하기 때문이다.
		
		while( (page<=전체페이지수) && (page<=currentPageSetup+numPerBlock) )
		{
			if(page==현재표시할페이지)
			{
				strList.append(" <span stlye='color:ornage; font-weight: bold;'>"+ page +"</span>");
			}else
			{
				strList.append(" <a href='"+ 링크설정URL +"pageNum="+ page +"'>"+ page +"</a>");
			}
			
			page++;
		}
		
		// Next(다음으로)
		n = 현재표시할페이지 + numPerBlock;
		if( (전체페이지수-currentPageSetup) > numPerBlock )
		{
			strList.append(" <a href='"+ 링크설정URL +"pageNum="+ n +"'>Next</a>");
		}
		
		// 마지막 페이지(맨 마지막으로)
		if( (전체페이지수>numPerBlock) && (currentPageSetup+numPerBlock<전체페이지수) )
		{
			strList.append(" <a href='"+ 링크설정URL +"pageNum="+ 전체페이지수 +"'>"+ 전체페이지수 +"</a>");
		}
		
		return strList.toString();
		
	} // pageIndexList(int 현재표시할페이지, int 전체페이지수, String 링크설정URL)
}
