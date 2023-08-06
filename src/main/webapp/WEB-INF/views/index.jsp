<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- index.jsp -->
<!DOCTYPE html>
<html>
<head>
  <title>테스트</title>
  <style>
      * {
          margin: 0px;
          box-sizing: border-box;
      }

      #root {
          display: flex;
          width: 100%;
          height: 1080px;
      }

      #left-side-wrap {
          width: 12%
      }

      #left-side-wrap > ul {
          margin-top: 20px;
          list-style-type: none;
          font-weight: bold;

      }

      #left-side-wrap > ul > li {
          text-indent: 10px;
          font-weight: normal;
      }

      #right-side-wrap {
          width: 80%;
          height: 800px;
          background: #aeffff;
      }

      #searchUser {
          height: 40px;
          margin: 10px 0px;
      }

      #right-menu-wrap {

      }

      #right-header > h1 {
          margin: 10px;
      }


      /*a태그 컬러 삭제*/
      a:link {
          color: black;
          text-decoration: none;
      }

      a:visited {
          color: black;
          text-decoration: none;
      }

      /* 모달 창 스타일 */
      .modal {
          display: none;
          position: fixed;
          z-index: 1;
          left: 0;
          top: 0;
          width: 100%;
          height: 100%;
          overflow: auto;
          background-color: rgba(0, 0, 0, 0.4);
      }

      .modal-content {
          background-color: #fefefe;
          margin: 5% auto;
          padding: 20px;
          border: 1px solid #888;
          width: 80%;
      }

      /*회원 추가 모달 스타일*/
      #inputGrid {
          display: grid;
          justify-content: space-evenly;
      }

      .add-grid-row {
          width: 100%;

          display: grid; /* 변경된 부분 */
          grid-template-columns: 15% 5% 20% 40% 20%;
      }

      .add-gird-items {
          width: auto;
          height: 50px;
      }

      .button-group {
          display: flex;
          justify-content: center;
      }

      .button-group > button {
          margin: 20px 50px;
      }


      /*회원 수정 모달 스타일*/


      /*유저 목록 부분.*/
      #userList {
          background: #fefefe;

          margin: 5px;
          border-radius: 5px;
      }

      /*유저 목록 1번 열*/
      .list-items:nth-child(1) {
          text-align: center;
      }

      /*유저 목록 1번 열*/
      .list-items:nth-child(1) {
          text-align: center;
      }

      /*유저목록 2번 열부터 5번 열 까지*/
      .list-items:nth-child(n+2):nth-child(-n+5) {
          text-align: center;
      }

      /*유저목록 6번 열부터 마지막 열 까지*/
      .list-items:nth-child(n+6) {
          text-align: end;
          padding-right: 10px;
      }


      .grid-row {
          border-bottom: black 1px solid;
          display: grid;
          grid-template-columns: 4% 5% 13% 6% 13% 40% 19%;
          line-height: 1.5;
      }

      .grid-row > div {
          border-right: black 1px solid;

      }

      #headerRow {
          font-weight: bold;
          text-align: center;
      }

      #contentRow {
          overflow-y: auto;
          -ms-overflow-style: none;
          scrollbar-width: none;
      }

      #contentRow::-webkit-scrollbar {
          width: 0;
          background: transparent;
      }

      #contentRow {

      }

      /*상단 메뉴 CSS*/
      .headerBtn {
          width: 130px;
          height: 40px;
          background: #fefefe;
          border: 0px;
          margin: 10px;
      }

      .headerBtn:hover {
          background: #888888;
      }

      .headerBtn:active {
          background: black;
      }

      #searchUser {
          display: flex;
          padding: 0px 10px;
      }

      #footer {
          justify-content: end;
          display: flex;
          padding: 20px 50px;
      }

      #footer > div {
          background: #aeffff;
          border-radius: 30px;
          width: 400px;
          display: flex;
          justify-content: space-between;
          margin: 0px 10px;

      }

      /*input 타입 숫자 위아래 버튼제거*/
      input[type="number"]::-webkit-inner-spin-button,
      input[type="number"]::-webkit-outer-spin-button {
          -webkit-appearance: none;
          margin: 0;
      }

      input[type="number"] {
          /* Firefox 용 화살표 숨기기 */
          -moz-appearance: textfield;
      }

      /* 에러 메시지의 스타일 */
      .error-message {
          position: fixed;
          top: 20px;
          right: 20px;
          padding: 10px 15px;
          margin-bottom: 10px;
          border: 1px solid #EF5350;
          border-radius: 4px;
          background-color: #FFEBEE;
          color: #C62828;
          font-weight: bold;
          z-index: 1000;
          opacity: 0;
          transition: opacity 0.3s ease-in-out;
          animation: fadein 0.5s;
      }

      .error-message.show {
          opacity: 1;
      }

      @keyframes fadein {
          from {
              opacity: 0;
          }
          to {
              opacity: 1;
          }
      }

  </style>
</head>
<body>
<div id="root">
  <div id="left-side-wrap">
    <ul>회원관리
      <li><a href="/">정보</a></li>
      <li>로그인정보</li>
      <li>추천인정보</li>
      <li>SNS보내기</li>
    </ul>
    <ul>회원관리
      <li>정보</li>
      <li>로그인정보</li>
      <li>추천인정보</li>
      <li>SNS보내기</li>
    </ul>
    <ul>회원관리
      <li>정보</li>
      <li>로그인정보</li>
      <li>추천인정보</li>
      <li>SNS보내기</li>
    </ul>
    <ul>회원관리
      <li>정보</li>
      <li>로그인정보</li>
      <li>추천인정보</li>
      <li>SNS보내기</li>
    </ul>
  </div>
  <div id="right-side-wrap">
    <div id="right-header" style="display: flex; width: 100%; justify-content: space-between">

      <h1>회원정보</h1>

      <div id="right-menu-wrap" style="display: flex">
        <button class="headerBtn" onclick="openModal('addMembers')">회원 추가</button>
        <button id="updateBtn" class="headerBtn">선택 수정</button>
        <button id="deleteBtn" class="headerBtn">회원 삭제</button>
        <div id="searchUser">
          <select id="searchType">
            <option value="name">이름으로 검색</option>
            <option value="id">ID로 검색</option>
            <option value="number">번호로 검색</option>
          </select>
          <input type="text" id="searchKeyword" placeholder="검색어를 입력하세요">
          <button onclick="searchUsers()">검색</button>
        </div>
      </div>

    </div>

    <!-- 모달 창 -->
    <jsp:include page="add-member.jsp"/>
    <jsp:include page="update-member.jsp"/>

    <!-- 유저 목록 -->
    <div id="userList">
      <% Integer totMon;
        Integer totScore; %>
      <!-- 메뉴 열 -->
      <div id="headerRow" class=" grid-row">
        <div>${fn:length(userInfo)}</div>
        <div>no</div>
        <div>이름</div>
        <div>번호</div>
        <div>아이디</div>
        <div>총 입금액</div>
        <div>현재 스코어</div>
      </div>

      <!-- 내용 열(DB기준 조회) -->
      <div id="contentRow">
        <c:set var="totalMoney" value="0" scope="page"/>
        <c:set var="totalScore" value="0" scope="page"/>
        <c:forEach items="${userInfo}" var="user">
          <div class=" grid-row">
            <div class="list-items">
              <input class="dataChecked" type="checkbox" data-no="${user.no}">
            </div>
            <div class="list-items">${user.no}</div>
            <div class="list-items">${user.name}</div>
            <div class="list-items">${user.number == null ? "-" : user.number}</div>
            <div class="list-items">${user.id}</div>
            <div class="list-items">
              <fmt:formatNumber value="${user.totMoney == null ? '-' : user.totMoney}" type="number" pattern="#,###"/>
            </div>
            <div class="list-items">
              <fmt:formatNumber value="${user.currentScore == null ? '-' : user.currentScore}" type="number"
                                pattern="#,###"/>

            </div>
            <c:set var="totalMoney" value="${totalMoney + user.totMoney}"/>
            <c:set var="totalScore" value="${totalScore + user.currentScore}"/>
          </div>
        </c:forEach>
      </div>

      <!-- 내용 열(20개 보다 모자라면 자동생성) -->
      <c:set var="listSize" value="${fn:length(userInfo)}"/>
      <c:if test="${listSize < 20}">
        <c:forEach begin="1" end="${20 - listSize}" varStatus="loop">
          <div class=" grid-row">
            <div class="list-items">
              <input type="checkbox">
            </div>
            <c:forEach begin="0" end="6">
              <div class="list-items"></div>
            </c:forEach>
          </div>
        </c:forEach>
      </c:if>
    </div>
    <div id="footer">
      <div>
        <div style="display: flex;align-items: end">총 입금액</div>
        <div style="display: flex; align-items: end">
          <div id="totalMoney" style="font-size: 40px">
            <fmt:formatNumber value="${totalMoney}" type="number" pattern="#,###"/>
          </div>
          <div>원</div>
        </div>
      </div>
      <div>
        <div style="display: flex;align-items: end">총 수입금</div>
        <div style="display: flex; align-items: end">
          <div id="totCurrnetScore" style="font-size: 50px">
            <fmt:formatNumber value="${totalScore}" type="number" pattern="#,###"/>

          </div>
          <div>원</div>
        </div>
      </div>
    </div>
  </div>
  <%-- 유저목록 끝 --%>
</div>

<script src="/js/main.js"></script>
<script src="<c:url value='/js/addMember.js'/>"></script>
<script src="<c:url value='/js/deleteMember.js'/>"></script>
<script src="<c:url value='/js/updateMember.js'/>"></script>
<script src="<c:url value='/js/searchMember.js'/>"></script>

</body>
</html>
