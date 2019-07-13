<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/table/css/bootstrap.css">
<!-- bar-rating -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="${path}/resources/css/fontawesome-stars-o.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/jquery.barrating.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/editor/js/service/HuskyEZCreator.js"></script>
<style>
#table {
	text-align: center;
	line-height: 158px;
}

.actor {
	width: 250px;
}

.director {
	width: 150px;
}

.movietitle {
	line-height: 150px;
}

#pagination {	/* 페이지 블럭 중앙 정렬 */
	display: table;
  	margin-left: auto;
  	margin-right: auto;
}

th {
	text-align: center;
}

img {
	width: 100%;
	height: 100%;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>

</head>
<body>

	<h1>
		<a href="/">KOREATE</a>
	</h1>
	<h1>REGISTER BOARD</h1>
	<form id="registForm" action="/sboard/register" method="post">
		<input type="hidden" name="uno" value="${userInfo.uno}" />
		<table border=1 style="width: 100%;" class="table table-hover table-bordered">
			<tr>
				<td>영화 검색</td>
				<td colspan=2><input type="text" id="title" name="title"> <!-- Trigger/Open The Modal -->
					<button type="button" id="myBtn">검색</button> <!-- The Modal -->
					<div id="myModal" class="modal">
						<!-- Modal content -->
						<div class="modal-content" >
							<div id="mContent"></div>
							<ul id="pagination" class="pagination"></ul>
							<span class="close">&times;</span>
						</div>		
					</div>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan=2><input type="text" name="title" required /></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td colspan=2><input type="text" name="writer" value="${userInfo.uname}" readonly required /></td>
			</tr>
			<tr id="movieInfo" style="display: none;"></tr> <!-- 해당 영화 정보 -->
			<tr>
				<td>나만의 평점</td>
				<td colspan="2">
					<p>나만의 평점을 등록해보세요</p>
					<div class="stars stars-example-fontawesome-o">
						<select id="example-fontawesome-o" name="rating" data-current-rating="5.6" >
							<option value=""></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
						<span class="title your-rating hidden"> 나의 평점: <span class="value" id="value"></span>&nbsp;</span>
						<script>
							$(function() {
								// start-rating-script
								$('.stars-example-fontawesome-o .current-rating').find('span').html('currentRating');
							    $('.stars-example-fontawesome-o .clear-rating').on('click', function(event) {
							        event.preventDefault();
							
							        $('#example-fontawesome-o')
							            .barrating('clear');
							    });
							    
							    $('#example-fontawesome-o').barrating({
							    	theme: 'fontawesome-stars-o',
							        showSelectedRating: false,
							        initialRating: 0,
							        onSelect: function(value ,text) {
										if(!value){
											$('#example-fontawesome-o').barrating('clear');
										} else {
											$('.stars-example-fontawesome-o .current-rating').addClass('hidden');
											$('.stars-example-fontawesome-o .your-rating').removeClass('hidden').find('span').html(value+"점");
										}
									},
									onClear: function(value, text) {
										$('.stars-example-fontawesome-o').find('.current-rating').removeClass('hidden').end().find('.your-rating').addClass('hidden');
									}
							    });
							 	// end start-rating-script
							});
							</script>
					</div>
				</td>				
			</tr>
			<tr>
				<td>내용</td>
				<td colspan=2><textarea style="width: 100%;" name="content" id="content" rows=3></textarea></td>
			</tr>
		</table>

		<div>
			<input type="button" id="saveBtn" value="SAVE" />
		</div>
	</form>
<script>
	/* 에디터 */
	var path = "${pageContext.request.contextPath}/resources/editor/SmartEditor2Skin.html";
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame(oEditors,"content",path,"createSEditor2");
	
	/* replaceAll */
	String.prototype.replaceAll = function(org, dest) {
	    return this.split(org).join(dest);
	}
	
	/* 모달: 영화 검색 */
	$("#myBtn").click(function(){
		var title = $("#title").val();
		
		if(title == ""){
			alert("검색어를 입력해주세요");
			$("#title").focus();
		}else{
			$("#myModal").css("display","block");
			
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
				},
				error : function(error){
					console.log(error.message);
				}
			});
		}
	});
	
	/* 모달: 영화 정보 리스트 */
	function getPageList(page){
		var title = $("#title").val();
		$.getJSON("query/"+title+"/"+page,function(data){
			var html = "<table id='table' class='table table-hover table-bordered'><tr><th>포스터</<th><th>제목</th><th>개봉년도</th><th>선택</th></tr>";
			for(var i=0; i<data.list.length;i++){
			var director = data.list[i].director.replaceAll("|", ", ");
			director = director.substr(0, director.length-2);
			var actor = data.list[i].actor.replaceAll("|", ", ");
			actor = actor.substr(0, actor.length-2);
			html +="<tr>"
				if(data.list[i].image ==""){
					html +="<td><img src='/resources/img/noimg.jpg'></td>";
				}else{
				html +="<td><img src='"+data.list[i].image+"'></td>";
				}
				html += "<td class='movietitle'><a href='"+data.list[i].link+"'>"+data.list[i].title+"</a></td>";
				html += "<td class='movietitle'>"+data.list[i].pubDate+"</td>"
				html += "<td class='movietitle'><input type='button' class='btn btnSelect' value='선택'/></td>"
				
				/* 해당 영화 정보 전달 */
				html += "<input type='hidden' name='title' value='"+data.list[i].title+"'/>";
				html += "<input type='hidden' name='link' value='"+data.list[i].link+"'/>";
				html += "<input type='hidden' name='subtitle' value='"+data.list[i].subtitle+"'/>";
				html += "<input type='hidden' name='pubDate' value='"+data.list[i].pubDate+"'/>";
				html += "<input type='hidden' name='director' value='"+director+"'/>";
				html += "<input type='hidden' name='image' value='"+data.list[i].image+"'/>";
				html += "<input type='hidden' name='actor' value='"+actor+"'/>";
				html += "<input type='hidden' name='userRating' value='"+data.list[i].userRating+"'/>";
				html +="</tr>"
			}
			html +="</table>"
			$("#mContent").html(html);
			printPage(data.pageMaker);
		});
	}
	
	/* 모달: 페이징처리 */
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

	/* 모달: 영화 선택 */
	$(document).on("click", ".btnSelect", function(){
		/* 해당 영화 정보 받기 */
		var title = $(this).closest("tr").find("input[name=title]").val();
		var link = $(this).closest("tr").find("input[name=link]").val();
		var subtitle = $(this).closest("tr").find("input[name=subtitle]").val();
		var pubDate = $(this).closest("tr").find("input[name=pubDate]").val();
		var director = $(this).closest("tr").find("input[name=director]").val();
		var actor = $(this).closest("tr").find("input[name=actor]").val();
		var userRating = $(this).closest("tr").find("input[name=userRating]").val();
		var image = $(this).closest("tr").find("input[name=image]").val();
		var image_width = (image == "") ? '140px' : '110px';
		image = (image == "") ? '/resources/img/noimg.jpg' : image;
		
		/* 해당 영화 정보 보여주기 */
		var html = "<td>영화 정보</td>";
		html += "<td style='vertical-align:middle; 'width='"+image_width+"'><img src='"+image+"' style='display: block;'</td>"
		html += "<td><table class='table table-hover table-bordered'>";
		html += "<tr><th colspan=2><a href='"+link+"'>"+title+"("+subtitle+")</a></th></tr>";
		html += "<tr><td>개봉</td><td>"+pubDate+"</td></tr>";
		html += "<tr><td>감독</td><td>"+director+"</td></tr>";
		html += "<tr><td>출연</td><td>"+actor+"</td></tr>";
		html += "<tr><td>평점</td><td>"+userRating+"</td></tr>";
		html += "</table></td>";
	 	$("#movieInfo").html(html);
		$("#movieInfo").show();
		
		/* 완료 후 닫기 */
		$("#myModal").css("display", "none");
	});
	
	/* 모달: 컨텐트영역 밖 클릭시 닫기 */
	$(document).on("click", "#myModal", function(){
		$("#myModal").css("display", "none");
	});
</script>
</body>
</html>