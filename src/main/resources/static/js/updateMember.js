console.log(3, "updateMember")

//메인 화면의 체크박스 클릭시 해당열의 내용 자동 이동
document.getElementById("updateBtn").addEventListener("click", async () => {

    for (let i = 0; i < 10; i++) {
        const updateInput = document.getElementById(`update-${i + 1}`);
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

        for (let i = 0; i < users.length; i++) {
            const user = users[i];
            const updateInput = document.getElementById(`update-${i + 1}`);
            updateInput.querySelector(`#update-${i + 1}-name`).value = user.name;
            updateInput.querySelector(`#update-${i + 1}-number`).value = user.number;
            updateInput.querySelector(`#update-${i + 1}-id`).value = user.id;
            updateInput.querySelector(`#update-${i + 1}-totMoney`).value = user.totMoney;
            updateInput.querySelector(`#update-${i + 1}-currentScore`).value = user.currentScore;
        }

        openModal("updateMembers");
    } catch (error) {
        console.error("오류 발생:", error);
    }
});
