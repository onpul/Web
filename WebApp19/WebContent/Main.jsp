<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body style="font-size: 9pt;">

<div>
	<table style="width: 500px;" border="1">
		<tr>
			<td colspan="2">
				<!-- top -->
				<jsp:include page="Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr style="height: 300px;">
			<td style="width: 150px;">
				<!-- Left -->
				<jsp:include page="Left.jsp"></jsp:include>
			</td>
			<td>
				Main(메인 화면)
			</td>
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