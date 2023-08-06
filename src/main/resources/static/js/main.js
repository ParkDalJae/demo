console.log(2, "index")

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

document.addEventListener("DOMContentLoaded", function() {
    const checkboxes = document.querySelectorAll(".dataChecked");
    console.log(checkboxes.length)
    checkboxes.forEach(checkbox => {
        checkbox.addEventListener("change", limitCheckboxSelection);
    });
    document.getElementById("totalMoney")
    document.getElementById("totCurrnetScore")
});

// 체크박스 선택 개수 제한 함수
function limitCheckboxSelection() {
    const maxCheckboxCount = 10;
    const checkedCheckboxes = document.querySelectorAll(".dataChecked:checked");

    if (checkedCheckboxes.length > maxCheckboxCount) {
        this.checked = false; // 현재 체크박스 체크 취소
        alert("최대 10개 까지만 선택하실 수 있습니다.")
    } else {
        console.log(checkedCheckboxes.length)
    }
}