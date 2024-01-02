<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 자기 자신 페이지(SendAndReceive07.jsp)로 부터 넘어온 데이터 수신
	// -> year, month
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");

	// Calendar 객체 생성
	//java.util.Calendar cal = java.util.Calendar.getInstance();
	Calendar cal = Calendar.getInstance();
	
	// 현재 년, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);			//-- 2023
	int nowMonth = cal.get(Calendar.MONTH)+1;		//-- 12
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);	//-- 11
	
	// 표시할 달력의 년, 월 구성 -> 페이지 최초 요청을 감안한 코드
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	// 페이지에 대한 요청이 최초 요청이 아닐 경우
	// Line 6~7 을 통해 수신한 데이터로 표시할 달력의 년,월 구성
	if(sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	// 테스트
	//out.print("<h1>selectYear: " + selectYear + "</h1>");
	//out.print("<h1>selectMonth: " + selectMonth + "</h1>");
	
	// 확인한 날짜로 년도 select option 구성
	// <option value="2013">2013</option>
	//						 :
	// <option value="2023" selected="selected">2023</option>
	// <option value="2033">2033</option>
	
	String yOptions = "";
	for(int year=(selectYear-10); year<=(selectYear+10); year++)	// 2012 ~2033
	{
		// 관찰1
		// "<option value="+2013+">"+2013+"</option>"
		// "<option value=2013>2013</option>"
		//yOptions += "<option value='"+year+"'>"+year+"</option>";
		
		// 관찰2
		//if(year==nowYear)
		//	yOptions += "<option value='"+year+"' selected='selected'>"+year+"</option>";
		//else
		//	yOptions += "<option value='"+year+"'>"+year+"</option>";
		
		// 상황1. 페이지 최초 요청일 때		-> sYear는 null		/ 현재 년도와 옵션이 같을 때 -> selected(O)
		// 상황2. 페이지 최초 요청이 아닐 때-> sYear는 null 아님/ 선택 년도와 옵션이 같을 때 -> selected(O)
		// 상황3. 나머지
		// **오늘 날짜,오늘 년월을 표시할 수 있도록 구성**
		if (sYear==null && year==nowYear)
			yOptions +="<option value='" + year +"' selected='selected'>"+ year + "</option>";
		else if (sYear!=null && year==Integer.parseInt(sYear))
			yOptions +="<option value='" + year +"' selected='selected'>"+ year + "</option>";
		else
			yOptions += "<option value='"+year+"'>"+year+"</option>";
		
	}
	
	// --------------------------------------------------------------------------------
	
	// 확인한 날짜로 월 select option 구성
	//<option vlaue="1">1</option>
	//				  :
	//<option vlaue="12" selected="selected">12</option>
	
	String mOptions="";
	for(int month=1; month<=12; month++)
	{
		// 관찰1
		//mOptions += "<option vlaue='" + month + "'>" + month + "</option>";
		
		// 관찰2
		//if(month==nowMonth)
		//	mOptions += "<option vlaue='" + month + "' selected='selected'>" + month + "</option>";
		//else
		//	mOptions += "<option vlaue='" + month + "'>" + month + "</option>";
		
		// 상황1. 페이지 최초 요청일 때	   -> sMonth는 null		/ 현재 월과 옵션이 같을 때 -> selected(O)
		// 상황2. 페이지 최초 요청 아닐 때 -> sMonth는 null 아님/ 현재 월과 옵션이 같을 때 -> selected(O)
		// 상황3. 나머지
		
		if(sMonth==null && month==nowMonth)
			mOptions += "<option vlaue='" + month + "' selected='selected'>" + month + "</option>";
		else if (sMonth!=null && month==Integer.parseInt(sMonth))
			mOptions += "<option vlaue='" + month + "' selected='selected'>" + month + "</option>";
		else
			mOptions += "<option vlaue='" + month + "'>" + month + "</option>";
	}
	
	// 그려야 할 달력의 1일이 무슨 요일인지 확인 필요
	// (만년 달력)
	//	각자~!!!
	
	// --------------------------------------------------------------------------------
	
	String calendar = "";
	
	// 0단계. 윤년
	// 각 달의 마지막 날짜 배열 구성
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	//			   1   2   3   4   5   6   7   8   9  10  11  12
	
	// 윤년인지 평년인지 확인
	if(selectYear%4==0 && selectYear%100!=0 || selectYear%1400==0)
		months[1] = 29;
	
	int nalsu=0;
	
	// 1단계. 현재 년도 -> 입력받은 년도 이전 년도까지의 날 수 계산
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 2단계. 현재 월 -> 입력받은 월의 이전 월까지 날 수 추가
	//int day=0;
	for(int i=0; i<(selectMonth-1); i++)
	{
		nalsu +=months[i];
	}
	
	nalsu ++;	// + 1
	
	// 3단계. 해당 년-해당 월의 첫날 요일 구하기
	String[] weekNames = {"일","월","화","수","목","금","토"};
	int week = nalsu%7;
	
	//System.out.println(week);
	
	// 4단계. 해당 년-해당 월 마지막 날짜 구하기
	int lastDay = months[selectMonth-1];
	
	// 달력 그리기 --------------------------------------------------------------------------------

	// 5단계. 해당 년-해당 월 기준 달력구성(출력, 그리기)
	String calStr = "";
	//calStr = "<table border='1'>";
	calStr = "<table>";
	
	// 요일 이름 발생
	calStr += "<tr>";
	for(int i=0; i<weekNames.length; i++)
	{
		if(i==0)	 // -- 일요일
			calStr += "<th style='color:red;'>" + weekNames[i] + "</th>";
		else if(i==6)//-- 토요일
			calStr += "<th style='color:blue;'>" + weekNames[i] + "</th>";
		else		//-- 평일
			calStr += "<th>" + weekNames[i] + "</th>";
	}
	calStr += "</tr>";
	
	// 빈 칸 공백 td 발생
	calStr += "<tr>";
	for(int i=1; i<=week; i++)
	{
		calStr += "<td></td>";
		
	}
	
	// 날짜 td 발생
	for(int i=1; i<=lastDay; i++)
	{
		week++;		//-- 날짜가 하루씩 찍힐 때 마다(구성이 이루어질 때 마다)
					//-- 요일도 함께 1씩 증가할 수 있도록 처리
					
		//calStr += "<td>"+ i +"</td>";
		
		if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0)	// 토요일인 오늘
			calStr += "<td class='nowSat'>"+ i +"</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1)	// 일요일인 오늘
			calStr += "<td class='nowSun'>"+ i +"</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay)	// 평일인 오늘
			calStr += "<td class='now'>"+ i +"</td>";
		else if(week%7==0)	// 오늘이 아닌 토요일
			calStr += "<td class='sat'>"+ i +"</td>";
		else if(week%7==1)	// 오늘이 아닌 일요일
			calStr += "<td class='sun'>"+ i +"</td>";
		else	// 오늘이 아닌 평일
			calStr += "<td>"+ i +"</td>";
			
		if(week%7==0)
			calStr += "</tr><tr>";	
			
				
	}
	
	// 빈 칸 공백 td 발생
	for(int i=0; i<=week; i++,week++)
	{
		if(week%7==0)
			break;
		
		calStr += "<td></td>";
	}
	
	if(week%7!=0)
		calStr += "</tr>";
	
	
	
	calStr += "</table>";				//-- end table

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
	td{text-align: right;}
	td.sun {color: red;}
	td.sat {color: blue;}
	td.now {background-color: #aef7f7; font-weight:bold;} /* 평일인 오늘 */
	td.nowSat {background-color: #aef7f7; font-weight: bold; color: blue;} /* 토요일인 오늘 */
	td.nowSat {background-color: #aef7f7; font-weight: bold; color: red;} /* 일요일인 오늘 */
</style>

</head>
<body class="section">
<%-- <%=nowYear %>
<%=nowMonth %>
<%=nowDay %> --%>
<!-- 
	○ 데이터 송수신 실습07
	
		- 달력을 출력하는 JSP 페이지를 구성한다.
		- 페이지 레이아웃은 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
		- 단, submit 버튼 없이 이벤트 처리할 수 있도록 한다.
		- 전송한 내용을 스스로 수신해서 출력해주는 형태의 페이지로 구성한다.
		- 연도 선택 기본 구성은 현재 연도를 기준으로 이전 10년, 이후 10년 으로 구성한다.
		(기본적으로 만년 달력 형태로 구성하는데 현재의 연, 월은 달력 객체로부터 확인할 수 있도록 한다.)
		- 월 선택 기본 구성은 1월 부터 12월 까지로 구성한다.
		
		  2013
			:
		[ 2023 ▼ ] 년 [ 12 ▼ ] 월	-> 현재 년도, 현재 월
			:
		  2033
		  
		 ----------------------------
		 ----------------------------
		 ----------------------------
		 ----------------------------
		 
		- 연도 select 나 월 select 의 내용이 변화되면 해당 연 월의 달력을 출력해주는 형태의 페이지로 구성한다.
		- 사용자 최초 요청 주소는
		http://localhost:3306/WebApp07/SendAndReceive07.jsp
		
	○ SendAndReceive07.jsp
	
 -->

<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>

<div class="layout">
	<div class="input_box" style="display: inline-block;">
		<form action="" method="get">
		<!-- <form action="" method="post"> -->
			<select id="year" name="year" onchange="formCalendar(this.form)">
				<!-- <option value="2013">2013</option>
				<option value="2014">2014</option>
				<option value="2015">2015</option>
				<option value="2016">2016</option>
				<option value="2017">2017</option>
				<option value="2018">2018</option>
				<option value="2019">2019</option>
				<option value="2020">2020</option>
				<option value="2021">2021</option>
				<option value="2022">2022</option>
				<option value="2023" selected="selected">2023</option>
				<option value="2024">2024</option>
				<option value="2025">2025</option>
				<option value="2026">2026</option>
				<option value="2027">2027</option>
				<option value="2028">2028</option>
				<option value="2029">2029</option>
				<option value="2030">2030</option>
				<option value="2031">2031</option>
				<option value="2032">2032</option>
				<option value="2033">2033</option> -->
				<%=yOptions %>
			</select> 년
			
			<select id="month" name="month" onchange="formCalendar(this.form)">
				<!-- <option vlaue="1">1</option>
				<option vlaue="2">2</option>
				<option vlaue="3">3</option>
				<option vlaue="4">4</option>
				<option vlaue="5">5</option>
				<option vlaue="6">6</option>
				<option vlaue="7">7</option>
				<option vlaue="8">8</option>
				<option vlaue="9">9</option>
				<option vlaue="10">10</option>
				<option vlaue="11">11</option>
				<option vlaue="12" selected="selected">12</option> -->
				<%=mOptions %>
			</select> 월
		</form>
	</div>
	
	<div class="result_box">
		<!-- 달력을 그리게 될 지점 -->
		<%=calStr %>
	</div>
	
</div>

<script type="text/javascript">
function formCalendar(obj)
{
	// 유효성 검사가 필요한 경우 삽입할 수 있는 영역~!!!
	
	// ...
	
	obj.submit();
}
</script>

</body>
</html>