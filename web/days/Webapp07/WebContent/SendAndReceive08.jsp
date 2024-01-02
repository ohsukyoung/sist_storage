<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// Calender 객체 생성
	Calendar cal = Calendar.getInstance();
	
	// 오늘 날짜 가져오기
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	//int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	// 이전 페이지(SendAndReceive08)로 부터 넘어온 데이터 수신
	// -> year, month
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	
	// 표시할 달력의 년, 월
	
	int year = nowYear;
	int month = nowMonth;
	
	if(strYear != null)
		year = Integer.parseInt(strYear);
	if(strMonth != null)
		month = Integer.parseInt(strMonth);
	
	// 이전과 이후 구성
	int preYear = year;
	int preMonth = month-1;
	
	if(preMonth < 1)
	{
		preYear = year-1;
		preMonth = 12;
	}
	
	int nextYear = year;
	int nextMonth = month+1;
	
	if(nextMonth > 12)
	{
		nextYear = year+1;
		nextMonth = 1;
	}
	
	
	// ---------------------------- calender
	String calendar = "";
	
	// 0단계. 윤년
	// 각 달의 마지막 날짜 배열 구성
	int[] days = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	//			   1   2   3   4   5   6   7   8   9  10  11  12
	
	// 윤년인지 평년인지 확인
	if(year%4==0 && year%100!=0 || year%1400==0)
		days[1] = 29;
	
	//System.out.println(lastDays[1]);
	
	// 1단계. 총 날짜수
	int total=0;
	total = (year-1)*365 + (year-1)/4 - (year-1)/100 + (year-1)/400;
	//total = (nowYear-1)*365 + ((nowYear-1)/4) - ((nowYear-1)/100) + ((nowYear-1)/400);
	
	// 2단계. 해당 년-1월-1일 ~ 해당 월-1일 까지 총 날짜수 구해서 1 더하기
	//int day=0;
	for(int i=0; i<(month-1); i++)
	{
		total +=days[i];
	}
	total +=1;
	
	// 3단계. 해당 년-해당 월의 첫날 요일 구하기
	String[] weeks = {"일","월","화","수","목","금","토","일"};
	int weekIdx = total%7;
	//System.out.println(nowYear+"년"+nowMonth+"월"+":"+weeks[weekIdx]);
	
	// 4단계. 해당 년-해당 월 마지막 날짜 구하기
	int lastDay = days[12-1];
	//System.out.println(nowMonth);
	
	// 5단계. 해당 년-해당 월 기준 달력구성(출력, 그리기)
	String tBody = "";
	String td = "";
	
	for(int i=0;i<weekIdx;i++)
	{
		td += "<td></td>";
	}
	
	int k=0;
	for(k=1;k<=lastDay;k++)
	{
		td += "<td>"+k+"</td>";
		
		if((k+weekIdx)%7==0)
		{
			tBody += "<tr>"+td+"</tr>";
			td = "";
		}
	}
	
	if(((weekIdx-1)+k)%7!=0)
	{
		for(int i=((weekIdx-1)+k)%7; i<7; i++)
		{
			td += "<td></td>";
		}
	}
	tBody += "<tr>"+td+"</tr>";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
<!-- 
	○ 데이터 송수신 실습 08
	
	- 달력을 출력하는 JSP 페이지를 구성한다.
	- 전송한 내용을 수신해서 출력해주는 형태의 단독 페이지로 구성한다.
	- submit 버튼 없이 이벤트 처리를 한다.
	
	◀ 2023년 12월 ▶
	
	-------------------------
	-------------------------
	-------------------------
	-------------------------
	
	- 『◀』 이나 『▶』 클릭 시
		해당 년 월의 달력을 출력해주는 형태의 페이지로 구현한다.
		
	- 사용자 최초 요청 주소는
	http://localhost:3306/WebApp07/SendAndReceive08.jsp 로 한다.
	
	○ SendAndReceive08.jsp
 -->
 
<div>
	<h1>데이터 송수신 실습 08</h1>
	<hr>
</div>

<div class="layout">
	<div class="input_box" style="display: inline-block;">
		<form action="" method="get">
			<a href="SendAndReceive08.jsp?year=<%=preYear %>&month=<%=preMonth %>">◀</a>&nbsp;&nbsp;
			<%-- <%=nowYear %>년 --%>
			<%=year %>년
			<%-- <%=nowMonth %>월 --%>
			<%=month %>월
			&nbsp;&nbsp;<a href="SendAndReceive08.jsp?year=<%=nextYear %>&month=<%=nextMonth %>">▶</a>
		</form>
	</div>
	<div class="result_box">
		<table id="calendar" name="calendar">
			<thead>
				<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>
			</thead>
			<tbody>			
				<%=tBody %>
			</tbody>
		</table>
	</div>
</div>

<script type="text/javascript">
/* function changeCalendar(obj, btn)
{
	if(btn == 1)
	{
		//console.log("왼쪽");
		obj.submit();
	}else if(btn==2)
	{
		obj.submit();
		//console.log("오른쪽");
		
	}else
	{
		
	}
} */

</script>

</body>
</html>