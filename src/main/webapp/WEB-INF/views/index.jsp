<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
          width: 15%
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
          height: 955px;
          background: #aeffff;
      }

      #right-menu-wrap {

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
          margin: 15% auto;
          padding: 20px;
          border: 1px solid #888;
          width: 80%;
      }

      /*유저 목록 부분.*/
      #userList{
          background: #fefefe;
          overflow-y: auto;
      }
      .listRows {
          border-bottom: black 1px solid;
      }

      .listRows > div {
          border-right: black 1px solid;

      }

      .grid-row {
          display: grid;
          grid-template-columns: auto repeat(6, minmax(0, 1fr));
          line-height: 1.5;
      }

      #headerRow {
          font-weight: bold;
      }

      #dataLows {
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
        <button class="headerBtn" onclick="openModal('updateMembers')">선택 수정</button>
        <button class="headerBtn">회원 삭제</button>
        <div id="searchUser">
          <select>
            <option>이름으로 검색</option>
            <option>ID로 검색</option>
            <option>번호로 검색</option>
          </select>
          <input type="text">
          <button>검색</button>
        </div>
      </div>

    </div>

    <!-- 모달 창 -->
    <jsp:include page="add-member.jsp"/>
    <jsp:include page="update-member.jsp"/>

    <!-- 유저 목록 -->
    <div id="userList" >

      <!-- 메뉴 열 -->
      <div id="headerRow" class="listRows grid-row">
        <div><input id="allChecked" type="checkbox"></div>
        <div>no</div>
        <div>이름</div>
        <div>아이디</div>
        <div>번호</div>
        <div>총 입금액</div>
        <div>현재 스코어</div>
      </div>

      <!-- 내용 열(DB기준 조회) -->
      <c:forEach items="${userInfo}" var="user">
        <div id="dataLows" class="listRows grid-row">
          <div>
            <input class="dataChecked" type="checkbox">
          </div>
          <div>${user.no}</div>
          <div>${user.name}</div>
          <div>${user.id}</div>
          <div>${user.number}</div>
          <div>${user.totMoney}</div>
          <div>${user.currentScore}</div>
        </div>
      </c:forEach>

      <!-- 내용 열(20개 보다 모자라면 자동생성) -->
      <c:set var="listSize" value="${fn:length(userInfo)}"/>
      <c:if test="${listSize < 20}">
        <c:forEach begin="1" end="${20 - listSize}" varStatus="loop">
          <div id="dataLows" class="listRows grid-row">
            <div>
              <input type="checkbox">
            </div>
            <c:forEach begin="0" end="6">
              <div></div>
            </c:forEach>
          </div>
        </c:forEach>
      </c:if>
    </div>
  </div><%-- 유저목록 끝 --%>
</div>

<script>
    // 모달 열기 함수
    function openModal(modalId) {
        document.getElementById(modalId).style.display = "block";
    }

    // 모달 닫기 함수
    function closeModal(modalId) {
        document.getElementById(modalId).style.display = "none";
    }

    // 모달 영역 밖 클릭 시 모달 닫기
    window.onclick = function (event) {
        var addModal = document.getElementById("addMembers");
        if (event.target === addModal) {
            closeModal('addMembers');
        }
        var updateModal = document.getElementById("updateMembers");
        if (event.target === updateModal) {
            closeModal('updateMembers');
        }
    };

    // 서버로 숫자 전송하는 함수(테스트용)
    function sendNumber() {
        var number = document.getElementById("numberInput").value;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/sendNumberToServer", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var result = JSON.parse(xhr.responseText); // JSON 형태의 응답을 파싱
                document.getElementById("modalContent").innerText = "name : " + result.name; // 결과 표시
                document.getElementById("modalContent2").innerText = "name : " + result.name; // 결과 표시
            }
        };
        xhr.send("number=" + number);
        const a = document.getElementById("resultUsers");
        console.dir(a);
    }
</script>
</body>
</html>
