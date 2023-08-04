<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 모달 창 -->
<div id="addMembers" class="modal">
  <div class="modal-content">
    <span onclick="closeModal('addMembers')" style="float: right; cursor: pointer">&times;</span>
    <h2>회원 추가</h2>

    <!-- 10행 5열의 input 박스 생성 -->
    <div id="inputGrid">

      <c:forEach begin="1" end="10" var="index">
        <div id="item-${index}" class="add-grid-row">
          <input id="item-${index}-name" class="add-gird-items" type="text" placeholder="이름">
          <input id="item-${index}-number" class="add-gird-items" type="number" placeholder="번호">
          <input id="item-${index}-id" class="add-gird-items" type="text" placeholder="아이디">
          <input id="item-${index}-totMoney" class="add-gird-items" type="number" placeholder="총 입금액">
          <input id="item-${index}-currentScore" class="add-gird-items" type="text" placeholder="현재 스코어">
        </div>
      </c:forEach>
    </div>

    <!-- 하단 버튼 -->
    <div class="button-group">
      <button id="addUsers" class="add-button">회원 추가</button>
      <button class="cancel-button" onclick="closeModal('addMembers')">취소</button>
    </div>
  </div>
</div>


