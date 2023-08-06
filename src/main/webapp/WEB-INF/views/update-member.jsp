<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 모달 창 -->
<div id="updateMembers" class="modal">
  <div class="modal-content">
    <span onclick="closeModal('updateMembers')" style="float: right; cursor: pointer">&times;</span>
    <h2>회원 수정</h2>
    <!-- 10행 5열의 input 박스 생성 -->
    <div id="updateGrid">

      <c:forEach begin="1" end="10" var="index">
        <div id="update-${index}" class="add-grid-row">
          <input id="update-${index}-no" style="display: none">
          <input id="update-${index}-name" class="add-gird-items" type="text" placeholder="이름">
          <input id="update-${index}-number" class="add-gird-items" type="number" placeholder="번호">
          <input id="update-${index}-id" class="add-gird-items" type="text" placeholder="아이디">
          <input id="update-${index}-totMoney" class="add-gird-items" type="number" placeholder="총 입금액">
          <input id="update-${index}-currentScore" class="add-gird-items" type="text" placeholder="현재 스코어">
        </div>
      </c:forEach>
    </div>

    <!-- 하단 버튼 -->
    <div class="button-group">
      <button id="updateUsers" class="update-button">회원 수정</button>
      <button class="cancel-button" onclick="closeModal('updateMembers')">취소</button>
    </div>
  </div>
</div>
