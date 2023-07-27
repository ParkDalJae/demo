<!-- index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>JSP Modal 창</title>
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
<h1>JSP Modal 창 예제</h1>
<p id="modalContent2">name : ${name}</p>

<!-- 모달 열기 버튼 -->
<button onclick="openModal()">모달 열기</button>

<!-- 모달 창 -->
<div id="myModal" class="modal">
	<div class="modal-content">
		<span onclick="closeModal()" style="float: right; cursor: pointer;">&times;</span>
		<h2>모달 창</h2>
		<input type="number" id="numberInput" placeholder="숫자 입력">
		<button onclick="sendNumber()">전송</button>
		<p id="modalContent">name : ${name}</p>
	</div>
</div>

<script>
	// 모달 열기 함수
	function openModal() {
		document.getElementById("myModal").style.display = "block";
	}

	// 모달 닫기 함수
	function closeModal() {
		document.getElementById("myModal").style.display = "none";
	}

	// 모달 영역 밖 클릭 시 모달 닫기
	window.onclick = function(event) {
		var modal = document.getElementById("myModal");
		if (event.target === modal) {
			closeModal();
		}
	}

	// 서버로 숫자 전송하는 함수
	function sendNumber() {
		var number = document.getElementById("numberInput").value;
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "/sendNumberToServer", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var result = JSON.parse(xhr.responseText); // JSON 형태의 응답을 파싱
				document.getElementById("modalContent").innerText = "name : " + result.name; // 결과 표시
				document.getElementById("modalContent2").innerText = "name : " + result.name; // 결과 표시
			}
		};
		xhr.send("number=" + number);
	}
</script>
</body>
</html>
