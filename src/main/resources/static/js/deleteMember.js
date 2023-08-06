console.log(4, "deleteMember")
document.getElementById("deleteBtn").addEventListener("click", async () => {
    const checkedCheckboxes = document.querySelectorAll(".dataChecked:checked");
    if (checkedCheckboxes.length === 0) {
        alert("삭제할 회원을 선택하세요.");
        return;
    }

    const selectedNos = Array.from(checkedCheckboxes).map(checkbox => checkbox.getAttribute("data-no"));
    console.log(selectedNos) //배열 입력 테스트용
    try {
        const response = await fetch("/api/deleteusers", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(selectedNos)
        });

        if (!response.ok) {
            throw new Error("서버 응답이 실패했습니다.");
        } else {
            const responseText = await response.text();
            alert(responseText); // 삭제 성공 메시지를 클라이언트에게 표시
        }

    } catch (error) {
        console.log("에러 발생 : " + error)
    }
    window.location.href = "/";
})
