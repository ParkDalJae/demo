console.log(3, "updateMember")

//메인 화면의 체크박스 클릭시 해당열의 내용 자동 이동
document.getElementById("updateBtn").addEventListener("click", async () => {
    //모달 오픈시 자동 null처리
    for (let i = 0; i < 10; i++) {
        const updateInput = document.getElementById(`update-${i + 1}`);
        updateInput.querySelector(`#update-${i + 1}-no`).value = null;
        updateInput.querySelector(`#update-${i + 1}-name`).value = null;
        updateInput.querySelector(`#update-${i + 1}-number`).value = null;
        updateInput.querySelector(`#update-${i + 1}-id`).value = null;
        updateInput.querySelector(`#update-${i + 1}-totMoney`).value = null;
        updateInput.querySelector(`#update-${i + 1}-currentScore`).value = null;
    }

    const checkedCheckboxes = document.querySelectorAll(".dataChecked:checked");

    if (checkedCheckboxes.length === 0) {
        alert("수정할 회원을 선택하세요.");
        return;
    }

    const selectedNos = Array.from(checkedCheckboxes).map(checkbox => checkbox.getAttribute("data-no"));
    console.log(selectedNos) //배열 입력 테스트용
    try {
        const response = await fetch("/api/selectusers", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(selectedNos)
        });

        if (!response.ok) {
            throw new Error("서버 응답이 실패했습니다.");
        }

        const users = await response.json();
        //checkBox의 값들만 input에 value 입력.
        for (let i = 0; i < users.length; i++) {
            const user = users[i];
            const updateInput = document.getElementById(`update-${i + 1}`);
            updateInput.querySelector(`#update-${i + 1}-no`).value = user.no;
            updateInput.querySelector(`#update-${i + 1}-name`).value = user.name;
            updateInput.querySelector(`#update-${i + 1}-number`).value = user.number;
            updateInput.querySelector(`#update-${i + 1}-id`).value = user.id;
            updateInput.querySelector(`#update-${i + 1}-totMoney`).value = user.totMoney;
            updateInput.querySelector(`#update-${i + 1}-currentScore`).value = user.currentScore;
        }
        //값이 있는 row 이외는 입력불가 처리
        for (let i = users.length; i < 10; i++) {
            const user = users[i];
            const updateInput = document.getElementById(`update-${i + 1}`);
            updateInput.querySelector(`#update-${i + 1}-name`).readOnly = true;
            updateInput.querySelector(`#update-${i + 1}-number`).readOnly = true;
            updateInput.querySelector(`#update-${i + 1}-id`).readOnly = true;
            updateInput.querySelector(`#update-${i + 1}-totMoney`).readOnly = true;
            updateInput.querySelector(`#update-${i + 1}-currentScore`).readOnly = true;
        }

        openModal("updateMembers");
    } catch (error) {
        console.error("오류 발생:", error);
    }
});
document.getElementById("updateUsers").addEventListener("click", async () => {
    const userVO = []

    for (let i = 0; i < 10; i++) {
        const updateNoValue = document.querySelector(`#update-${i + 1}-no`).value;
        const updateNameValue = document.querySelector(`#update-${i + 1}-name`).value;
        const updateNumberValue = document.querySelector(`#update-${i + 1}-number`).value;
        const updateIdValue = document.querySelector(`#update-${i + 1}-id`).value;
        const updateTotMoneyValue = document.querySelector(`#update-${i + 1}-totMoney`).value;
        const updateCurrentScoreValue = document.querySelector(`#update-${i + 1}-currentScore`).value;
        if (updateIdValue != "")
            userVO.push({
                no: updateNoValue,
                name: updateNameValue,
                number: updateNumberValue,
                id: updateIdValue,
                totMoney: updateTotMoneyValue,
                currentScore: updateCurrentScoreValue
            });
    }
    try {
        const response = await fetch("/api/updateusers", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(userVO)
        });

        if (!response.ok) {
            throw new Error("서버 응답이 실패했습니다.");
        }

        window.location.href = '/';
    } catch (error) {
        console.error("오류 발생:", error);
    }

})