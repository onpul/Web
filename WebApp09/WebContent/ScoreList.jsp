<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!--  
	○ WebApp09
	
	   - 여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
	     총점과 평균을 계산하여 출력해줄 수 있는 프로그램을 구현한다.
	   - 리스트 출력 시 번호 오름차순 정렬하여 출력할 수 있도록 한다.
	   - 데이터베이스 연동하여 처리한다.
	     (TBL_SCORE, SCORESEQ 활용)
	   - 즉, 성적 처리 프로그램을 데이터베이스 연동하여
	     JSP로 구성할 수 있도록 한다.
	     
	     데이터베이스 연결 및 데이터 처리
	     -------------------------------------------------------------
	     성적 처리
	     
	     이름(*)	[ textbox ] → 이름 입력 확인
	     국어점수 	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	     영어점수 	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	     수학점수 	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	     
	     < 성적 추가 >			→ button
	     
	     번호		이름		국어점수 영어점수 수학점수		총점		평균
	     1		   이시우          90       80       70         xxx			xx.x
	     2		   이윤태          80       70       60         xxx			xx.x
	     3		   홍은혜          70       60       70         xxx			xx.x
-->

</body>
</html>