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
      .inner form {
         height: 200px;
         padding-top: 30px;
      }
      .inner form:hover {
         background-color: #ccc;
         cursor: pointer;
      }
      
      .BACK {
      }
</style>


<!-- 리워드 창 -->
<div class="modal">
   <div class="inner">
            <c:forEach items="${rewardList}" var="list" varStatus="status">
                     <form action="/subPage/back.do" method="post" id="form${list.r_seq}" onclick="addSubmit(${list.r_seq})">
                        <span>선택 ${list.r_seq}</span><br>
                        <span>${list.r_count}개 남음</span>
                        <h3 style="text-align: center;">${list.r_price} 원</h3>
                        <span>${list.r_content}</span><br>
                        <input type="text" name="r_addMoney" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="addMondy${list.r_seq}">
                        <input type="hidden" name="p_seq" value="${project.p_seq}">
                        <input type="hidden" name="r_seq" value="${list.r_seq}">
                        <input type="hidden" name="r_price" value="${list.r_price}">
                        <input type="hidden" name="r_count" value="${list.r_count}">
                        <!-- 
                        <button type="submit">back</button>
                         -->
                        <button type="button" class="BACK" onclick="back_this(${list.r_seq})" disabled>back</button>
                     </form>
            </c:forEach>
   </div>
</div>