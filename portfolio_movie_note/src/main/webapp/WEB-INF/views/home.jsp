<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<h1>MAINPAGE</h1>

<div id="aaa" style="display:none;width:300px;height:400px;background:black;">
	<h2>MODAL!!!!!!!!!!!!!!!!!!!!!</h2>	
	<a href="movieList">movie</a>
	
</div>
<button id="btn">모달</button>
<a href="main">test</a>
<a href="/search">영화 검색</a>
<a href="login">로그인화면</a>
<a href="/register">글쓰기</a>
<a href="/naver/naverLogin">네이버로그인</a>
</body>
<script>
	$("#btn").click(function(){
		$("#aaa").toggle();
	});
</script>
</html>