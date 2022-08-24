<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>
		.modal {
           position: fixed;
           top:0; left:0;
           width: 100%;
           height: 100%;
           z-index: 100;
           background: rgba(0,0,0,0.7);
		   display: none;
       }
        .inner{
            width: 620px;
            height: 600px;
            background: #fff;
            position: absolute;
            left: 50%; top: 50%;
            transform: translate(-50%, -55%);
            text-align: center;
        }
		.inner ul {
		}
		.inner ul li {
			height: 200px;
		}
		.inner ul li:hover {
			background-color: #ccc;
			cursor: pointer;
		}
</style>


<!-- 리워드 창 -->
<div class="modal">
	<div class="inner">
		<ul>
			<c:forEach items="${rewardList}" var="list" varStatus="status">
				<li>
					<div>
						<span>선택 ${list.r_seq}</span>
						<h3 style="text-align: center;">${list.r_price} 원</h3>
						<span>${list.r_content}</span><br>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>