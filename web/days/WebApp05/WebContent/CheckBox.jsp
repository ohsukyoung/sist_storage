<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBox.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body class="section">
<div>
	<h1>JSP를 이용한 데이터 송수신 실습 04</h1>
	<hr>
	<p>CheckBox.jsp -> CheckBoxOk.jsp</p>
</div>

<div class="layout">
	<h2>checkbox, textarea 데이터 전송</h2>
	
	<form action="/WebApp05/CheckBoxOk.jsp" method="post">
		<div class="input_box" style="display: inline-block;">
			<ul>
				<li>
					<span class="tit">이름</span><input type="text" name="name" class="txt">
				</li>
				<li>
					<span class="tit">메모</span><textarea name="meno" rows="5" cols="30"></textarea>
				</li>
				<li style="display:flex;">
					<span class="tit">이상형</span>
					<div>
						<label><input type="checkbox" name="checkGruop" value="조휴일">조휴일</label>
						<label><input type="checkbox" name="checkGruop" value="유재석">유재석</label>
						<label><input type="checkbox" name="checkGruop" value="류진">류진</label>
						<label><input type="checkbox" name="checkGruop" value="정우성">정우성</label>
						<label><input type="checkbox" name="checkGruop" value="차은우">차은우</label>
						<br>
						
						<label><input type="checkbox" name="checkGruop" value="카리나">카리나</label>
						<label><input type="checkbox" name="checkGruop" value="서강준">서강준</label>
						<label><input type="checkbox" name="checkGruop" value="박은빈">박은빈</label>
						<label><input type="checkbox" name="checkGruop" value="고윤정">고윤정</label>
					</div>
				</li>
			</ul>
			<div class="btn_box"><input type="submit" value="전송하기" class="btn control"></div>
		</div>
	</form>
</div>

</body>
</html>