<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="section">
<!-- include 액션태그가 예전만큼 중요도가 높진 않다.(iframe 사용함) -->

<div class="layout">
	<table class="table" border="1" style="width: 400px;">
		<tr>
			<td colspan="2">
				<!-- Top -->
				<jsp:include page="Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr style="height: 300px;">
			<td>
				<!-- Left -->
				<jsp:include page="Left.jsp"></jsp:include>
			</td>
			<td>Main(메인화면)</td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- Bottom -->
				<jsp:include page="Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</div>

</body>
</html>