<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmployeeInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script type="text/javascript">
	// $();
	// jquery();
	// $(document).ready();
	$(document).ready(function()
	{
		// Ajax 요청 및 응답 처리
		ajaxRequest();	
		
		// jQuery-UI 캘린더를 불러오는 함수 처리(datapicker())
		$("#birthday").datepicker(
		{
			dateFormat: "yy/mm/dd"
			, monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
			, monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
			, changeMonth: true
			, changeYear: true
			
		});
		
		// 직위(select)의 선택된 내용이 변경되었을 경우 수행해야 하는 코드 정리
		$("#positionId").change(function()
		{
			// alert("변경~!!!");
			
			// Ajax 요청 및 응답 처리
			ajaxRequest();			
		});
		
		// 직원 추가 버튼이 클릭되었을 때 수행되어야 할 코드 처리
		$("#submitBtn").click(function()
		{
			//alert("확인");
			
			// 데이터 검사(누락된 입력값이 있는지 없는지에 대한 여부 확인)
			if($("#name").val()=="" || $("#ssn1").val()=="" || $("#ssn2").val()==""
				|| $("#birthday").val()=="" || $("#telephone").val()==""	
				|| $("#basicPay").val()=="")
			{
				$("#err").html("필수 입력 항목이 누락되었습니다.");
				$("#err").css("display","inline");
				return;						//--submit 액션 처리 중단
			}
			
			// 최소 기본급에 대한 유효성 검사
			// if(직급별 최소기본급 > 사용자가입력한기본급)
			// → 안내 후 submit 액션 처리 중단			
			if( parseInt($("#minBasicPay").text()) > parseInt($("#basicPay").val()) )
			{
				$("#err").html("입력하신 기본급이 최소 기본급보다 작습니다.");
				$("#err").css("display","inline");
				return;
			}
			
			// 폼 submit 액션 처리 수행
			$("#employeeForm").submit();
		})
		
	});
	
	function ajaxRequest()
	{
		//alert("Ajax 요청 및 응답 처리");
		
		//『$.post()』/ 『$.get()』
		//-- jQuery 에서 Ajax 를 써야 할 경우 지원해주는 함수
		//   (서버 측에서 요청한 데이터를 받아오는 기능의 함수)
		
		// ※ 이 함수(『$.post()』)의 사용 방법(방식)
		//-- 『$.post(요청주소, 전송데이터, 응답액션처리)』
		//	 ·요청주소(url)
		//	  → 데이터를 요청할 주소(파일)에 대한 정보
		//	 ·전송 데이터(data)
		//	  → 서버 측에 요청하는 과정에서 내가 전달할 파라미터
		//	 ·응답액션처리(function)
		//	  → 응답을 받아 처리하는 함수(기능 처리)
		
		// ※ 참고로... data 는 파라미터의 타입을 그대로 취하게 되므로
		//	  html이든... 문자열이든... 상관없다.
		
		$.post("ajax.action",{positionId:$("#positionId").val()},function(data){
			$("#minBasicPay").html(data);
		});
		
	};
</script>


</head>
<body>

<!-- ------------------------------------
   #21. EmployeeInsertForm.jsp
		- 직원 데이터 입력 페이지
		- 관리자만 접근 허용
----------------------------------------- -->

	<div>
		<!-- 메뉴 영역 -->
		<div>
			<c:import url="EmployeeMenu.jsp"></c:import>
		</div>

		<!-- 콘텐츠 영역 -->
		<div id="content">
			<h1>[ 직원 추가 ]</h1>
		</div>

		<form action="employeeinsert.action" method="post" id="employeeForm">
			<table>
				<tr>
					<th>이름</th>
					<td><input type="text" id="name" name="name" placeholder="이름"></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" id="ssn1" name="ssn1"
						style="width: 100px;" placeholder="앞 6자리"> <input
						type="text" id="ssn2" name="ssn2" style="width: 100px;"
						placeholder="뒤 7자리"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" id="birthday" name="birthday"
						placeholder="생년월일"></td>
				</tr>
				<tr>
					<th>양/음력</th>
					<td><input type="radio" value="0" id="lunar0" name="lunar"
						checked="checked"> <label for="lunar0">양력</label> <input
						type="radio" value="1" id="lunar1" name="lunar"> <label
						for="lunar1">음력</label></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="tel" id="telephone" name="telephone"
						placeholder="전화번호"></td>
				</tr>
				<tr>
					<th>지역</th>
					<td>
						<!-- 
						<select name="regionId" id="regionId">
							<option value="1">관악구</option>
							<option value="2">마포구</option>
							<option value="3">은평구</option>
							<option value="4">도봉구</option>
						</select>
						 --> <select name="regionId" id="regionId">
							<c:forEach var="region" items="${regionList }">
								<option value="${region.regionId}">${region.regionName }</option>
							</c:forEach>
					</select>
					</td>
				</tr>
				<tr>
					<th>부서</th>
					<td><select name="departmentId" id="departmentId">
							<!-- 
							<option value="1">축구부</option>
							<option value="2">야구부</option>
							<option value="3">수영부</option>
							<option value="4">원예부</option>
							<option value="5">독서부</option>
							 -->
							<c:forEach var="department" items="${departmentList }">
								<option value="${department.departmentId}">${department.departmentName }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>직위</th>
					<td><select name="positionId" id="positionId">
							<!-- 
							<option value="1">팀장</option>
							<option value="2">기술고문</option>
							<option value="3">팀원</option>
							<option value="4">탈영병</option>
							<option value="5">엑스맨</option>
						 	-->
							<c:forEach var="position" items="${positionList }">
								<option value="${position.positionId}">${position.positionName }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>기본급</th>
					<td><input type="text" id="basicPay" name="basicPay">
						(최소 기본급 <span id="minBasicPay"
						style="color: red; font-weight: bold;">0</span>원)
					<!-- 선택한 직위에 따라 기본급이 바뀌어야하는데.. 폼자체에서 모든 내용을 바꾸지 않고, 최소 기본급만 있는 상태로 만들기 위해서 -->
					</td>
				</tr>
				<tr>
					<th>수당</th>
					<td><input type="text" id="extraPay" name="extraPay"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<br><br>
						
						<button type="button" class="btn" id="submitBtn"
						style="width: 40%; height: 50%;">직원 추가</button>
						<button type="button" class="btn" id="listBtn"
						style="width: 40%; height: 50%;"
						onclick="location.href='employeelist.action'">직원 리스트</button>
						<br><br>
						
						<span id="err" style="color: red; font-weight: bold; display: none;"></span>	
					</td>
				</tr>

			</table>
		</form>

	</div>


</body>
</html>