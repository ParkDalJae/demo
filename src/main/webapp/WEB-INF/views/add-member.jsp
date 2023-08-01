<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 모달 창 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span onclick="closeModal()" style="float: right; cursor: pointer">&times;</span>
        <h2>모달 창</h2>
        <input type="number" id="numberInput" placeholder="숫자 입력" />
        <button onclick="sendNumber()">전송</button>
        <p id="modalContent">userInfo :
            <c:forEach items="${userInfo}" var="user">
        <p>${user.name}</p>
        </c:forEach>
        </p>
    </div>
</div>
