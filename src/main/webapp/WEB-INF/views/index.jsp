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
      .listRows{
          border-bottom: black 1px solid;
          border-right: black 1px solid;
      }
      .listRows>div,span{
          border-right: black 1px solid;

      }
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

  </div>
  <div id="right-side-wrap">
    <div id="right-header" style="display: flex; width: 100%; justify-content: space-between">

      <h1>회원정보</h1>

      <div style="display: flex">
        <button onclick="openModal('addMembers')">회원 추가</button>
        <button onclick="openModal('updateMembers')">선택 수정</button>
        <button>회원 삭제</button>
        <div id="searchUser">
          이름으로 검색 :
          <input type="text">
          <button>검색</button>
        </div>
      </div>

    </div>

    <!-- 모달 창 -->
    <jsp:include page="add-member.jsp"/>
    <jsp:include page="update-member.jsp"/>
    <!-- 유저 목록 -->
    <%--    <div id="userList">--%>
    <%--      <p id="modalContent2">userInfo :--%>
    <%--        <c:forEach items="${userInfo}" var="user">--%>
    <%--          <br> ${user.no} ${user.name} ${user.id} ${user.totMoney} ${user.currentScore}--%>
    <%--        </c:forEach>--%>
    <%--      </p>--%>

    <%--      <!-- 메인 리스트 -->--%>
    <%--      <div id="resultUsers">--%>
    <%--        result 유저 확인--%>
    <%--        <c:forEach items="${userInfo}" var="user">--%>
    <%--          <p>${user.name}</p>--%>
    <%--        </c:forEach>--%>
    <%--      </div>--%>
    <%--    </div>--%>
    <div id="userList" style="width: 95%; height: 955px; overflow-y: auto;">

      <div class="listRows" style="display: flex; justify-content: space-evenly; font-weight: bold;">
        <span>체크박스</span>
        <span>no</span>
        <span>이름</span>
        <span>아이디</span>
        <span>번호</span>
        <span>총 입금액</span>
        <span>현재 스코어</span>
      </div>

      <c:forEach items="${userInfo}" var="user">
        <div class="listRows" style="display: flex; justify-content: space-evenly;">
          <div>
            <input type="checkbox">
          </div>
          <div>${user.no}</div>
          <div>${user.name}</div>
          <div>${user.id}</div>
          <div>${user.number}</div>
          <div>${user.totMoney}</div>
          <div>${user.currentScore}</div>
        </div>
      </c:forEach>

      <c:set var="listSize" value="${fn:length(userInfo)}"/>
      <c:if test="${listSize < 10}">
        <c:forEach begin="1" end="${10 - listSize}" varStatus="loop">
          <div class="listRows" style="display: flex; justify-content: space-evenly;">
            <div>
              <input type="checkbox">
            </div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
          </div>
        </c:forEach>
      </c:if>
    </div>
  </div>
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
