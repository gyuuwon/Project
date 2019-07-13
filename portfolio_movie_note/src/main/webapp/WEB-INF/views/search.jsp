<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Move Search</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
</head>
<style>
.pagination {
margin-left:450px;
}
/* ul li{
	list-style: none;
}

.pagination li{
	float:left;
	padding:3px;
	border:1px solid skyblue;
	margin:3px;
}
.pagination li a{
	margin:3px;
	text-decoration: none;
	color:black;
}
.active{
	background:skyblue;
}
.pagination > .active > a{
		color:white;
	} */
#table{
	text-align:center; 
	line-height: 158px;
	width:1000px;
	}
	.actor{
		width:250px;
	}
	.director{
	width:150px;
	}
.movietitle{
line-height: 150px;
}
th{
	text-align:center; 
}
img{
	width:100%;
	height:100%;
}
</style>
<body>
<input type="text" id="title"name="title">
<input type="button" id="search" value="영화 검색">
<div id="result">

</div>
<ul id="pagination" class="pagination">

</ul>



</body>

<c:forEach items="">

</c:forEach>
<script>


	$("#search").click(function(){
		var title = $("#title").val();
		
		if(title == ""){
			alert("검색어를 입력해주세요");
			$("#title").focus();
		}else{
			$.ajax({
				type : "get",
				url : "query",
				data : {
					query : title,
				},
				success : function(data){
					var vo = data;
					console.log("vo : "+vo.items.length);
					if(data.total >100 ){
						alert('검색 결과가 너무많습니다.');
						$("#title").focus();
					}else{
						getPageList(1);
					}
					/* var html = "<table id='table' class='table table-hover table-bordered'><tr><th>포스터</<th><th>제목</th><th>감독</th><th>출연배우</th><th>평점</th></tr>";
					for(var i=0; i<data.items.length;i++){
					var director = data.items[i].director.split('|');
					var actor = data.items[i].actor.split('|');
						html +="<tr>"
						if(data.items[i].image ==""){
							html +="<td><img src='/resources/img/noimg.jpg'></td>";
						}else{
						html +="<td><img src='"+data.items[i].image+"'></td>";
						}
						html +="<td class='movietitle'><a href='"+data.items[i].link+"'>"+data.items[i].title+"</a></td>";
						html +="<td class='director'>"+director+"</td>";
						html +="<td class='actor'>"+actor+"</td>";
						html +="<td>"+data.items[i].userRating+"</td>"
						html +="</tr>"
					}
					html +="</table>"
					$("#result").html(html);
					} */
				},
				error : function(error){
					console.log(error.message);
				}
			});
		}
	});
	
	function getPageList(page){
		var title = $("#title").val();
		$.getJSON("query/"+title+"/"+page,function(data){
			var html = "<table id='table' class='table table-hover table-bordered'><tr><th>포스터</<th><th>제목</th><th>개봉년도</th><th>감독</th><th>출연배우</th><th>평점</th></tr>";
			for(var i=0; i<data.list.length;i++){
			var director = data.list[i].director.split('|');
			var actor = data.list[i].actor.split('|');
				html +="<tr>"
				if(data.list[i].image ==""){
					html +="<td><img src='/resources/img/noimg.jpg'></td>";
				}else{
				html +="<td><img src='"+data.list[i].image+"'></td>";
				}
				html +="<td class='movietitle'><a href='"+data.list[i].link+"'>"+data.list[i].title+"</a></td>";
				html +="<td class='movietitle'>"+data.list[i].pubDate+"</td>"
				html +="<td class='director'>"+director+"</td>";
				html +="<td class='actor'>"+actor+"</td>";
				html +="<td>"+data.list[i].userRating+"</td>"
				html +="</tr>"
			}
			html +="</table>"
			$("#result").html(html);
			printPage(data.pageMaker);
		});
	}
	function printPage(pageMaker){
		var str = "";
		if(pageMaker.prev){
			str +="<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
		}
		for(var i=pageMaker.startPage;i<=pageMaker.endPage; i++){
			var strClass = pageMaker.cri.page == i ? "class='active'" : "";
			str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
			}
		if(pageMaker.next){
			str +="<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
		}
		$("#pagination").html(str);
	}
	$("#pagination").on("click","li a",function(){
		event.preventDefault();
		var page = $(this).attr("href");
		getPageList(page);
	});
	
</script>
</html>