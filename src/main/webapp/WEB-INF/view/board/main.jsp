<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<style>
.slider img{display:block; width:100%; max-width:100%; height:300px;} /* 슬라이더 영역 CSS */
</style>
</head>
<body>
<!-- 상단 -->
<c:import url="/WEB-INF/view/include/topMenu.jsp"/>
<!-- 그 게시판 윗 부분 그림-->
<article class="slider">
	<img src="http://localhost:8090/GoroGoroCommunity/image/convenientStore.png"> 
</article>

<!--Post List(게시글 리스트)-->
<div class="container" style="margin-top:100px; margin-bottom:100px;">
	<div class="card shadow-none">
		<div class="card-body">	
			<h4 class="card-title">${boardName }</h4>
			<table class="table table-hover" id='board_list'>
				<thead>
					<tr>
						<th class="text-center d-none d-md-table-cell">글번호</th>
						<th class="w-50">제목</th>
						<th class="text-center d-none d-md-table-cell">작성자</th>
						<th class="text-center d-none d-md-table-cell">작성날짜</th>
						<th class="text-center d-none d-md-table-cell">조회수</th>
						<th class="text-center d-none d-md-table-cell">공감수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="postDTO" items="${postList }" >
					<tr>
						<td class="text-center d-none d-md-table-cell">${postDTO.postNo }</td>
						<td>
							<a href='read?postNo=${postDTO.postNo}' style="color:black">
								${postDTO.title } 
								<font color="red">[${postDTO.replyCount }]</font>
							</a>
						</td>
						<td class="text-center d-none d-md-table-cell">${postDTO.writer }</td>
						<td class="text-center d-none d-md-table-cell"><fmt:formatDate value="${postDTO.regDate }" pattern="yyyy-MM-dd"/></td>
						<td class="text-center d-none d-md-table-cell">${postDTO.viewCount }</td>
                        <td class="text-center d-none d-md-table-cell">${postDTO.sameThinking }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="text-right">
				<a href="write?boardNo=${boardNo }" class="btn btn-warning">글쓰기</a>
			</div>
			<!-- 페이징(Paging) -->			
			<div class="d-none d-md-block">
				<ul class="pagination justify-content-center">
				<!-- 이전 -->
				<c:choose>
					<c:when test="${pageDTO.prePage <= 0 }" >
						<li class="page-item disabled">
							<a href="#" class="page-link">이전</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a href="${root }main?boardNo=${boardNo}&page=${pageDTO.prePage}" class="page-link">이전</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<!-- 1 2 3 4 5 6 7 8 9 10 -->
				<c:forEach var="idx" begin="${pageDTO.min }" end="${pageDTO.max }">
				<c:choose>
					<c:when test="${idx == pageDTO.currentPage }">
						<li class="page-item active">
							<a href="${root }main?boardNo=${boardNo}&page=${idx}" class="page-link">${idx}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a href="main?boardNo=${boardNo}&page=${idx}" class="page-link">${idx}</a>
						</li>
					</c:otherwise>
				</c:choose>
				</c:forEach>  
				
				<!-- 다음 -->
				<!--맨 마지막 페이지인 경우에는 다음 버튼이 안 보이도록 함 (최대페이지가 전체페이지개수보다 크면 다음이 안 보이도록 함) -->
				<c:choose>
					<c:when test="${pageDTO.max >= pageDTO.pageCount }">
						<li class="page-item disabled">
							<a href="#" class="page-link">다음</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a href="${root }main?boardNo=${boardNo}&page=${pageDTO.nextPage}" class="page-link">다음</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				</ul>
			</div>
			
		<!-- 검색기능 -->
		<form class="text-center" method="get" action="#" style="margin-bottom:50px;">
			<div class="box_select">
				<select name="stype" class="opt_search_type">
					<option value="0" selected="selected">제목</option>
					<option value="1">내용</option>
					<option value="2">작성자</option>
					<option value="3">제목+내용</option>
				</select>
				<input type="text" name="keyword" class="tf_comm tf_search_keyword" value="">
				<button type="submit" class="btn btn-warning btn-sm">검색</button>
			</div>			
		</form>
	
		</div>
	</div>
</div>
<c:import url="/WEB-INF/view/include/bottomInfo.jsp" />
</body>
</html>