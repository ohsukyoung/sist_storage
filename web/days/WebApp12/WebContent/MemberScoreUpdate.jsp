<%@page import="com.test.ajax.MemberScoreDAO"%>
<%@page import="com.test.ajax.MemberScoreDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberScoreUpdate.jsp
	
	// 이전 페이지로(MemberScoreUpdateForm.jsp)부터 넘어온 데이터 수신
	// -> sid, kor, eng, mat
	
	String sid = request.getParameter("sid");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	int kor = Integer.parseInt(korStr);
	int eng = Integer.parseInt(korStr);
	int mat = Integer.parseInt(korStr);
	
	// MemberScoreDAO 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		MemberScoreDTO member = new MemberScoreDTO();
		member.setSid(sid);
		member.setKor(kor);
		member.setEng(eng);
		member.setMat(mat);
		
		dao.modify(member);
		
		// 위 메소드 호출 결과 반환값을 활용한 분기 처리 가능~!!!
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 변경된 URL로 다시 요청할 수 있도록 안내
	response.sendRedirect("MemberScoreSelect.jsp");
%>