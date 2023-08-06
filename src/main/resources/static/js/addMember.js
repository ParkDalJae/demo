console.log(1, "addMember")
document.addEventListener("DOMContentLoaded", () => {
    console.log(3, "DOMContentLoaded")
    const addUsers = document.getElementById("addUsers");

    addUsers.addEventListener("click", () => {
        let errorMessages = [];
        let userVO = [];

        const existingErrorMessages = document.querySelectorAll(".error-message");
        existingErrorMessages.forEach(errorMessage => {
            errorMessage.remove();
        });

        for (let i = 1; i <= 10; i++) {
            const idInput = document.querySelector(`#item-${i}-id`);
            const nameInput = document.querySelector(`#item-${i}-name`);
            const numberInput = document.querySelector(`#item-${i}-number`);
            const totMoneyInput =   document.querySelector(`#item-${i}-totMoney`);
            const totMoneyValue = parseInt(totMoneyInput.value.trim())
            const currentScoreInput = document.querySelector(`#item-${i}-currentScore`);
            const totCurrentScoreValue = parseInt(currentScoreInput.value.trim())

            if(totMoneyValue<0){
                displayErrorMessage(totMoneyInput,"입금액은 음수일 수 없습니다!")
                return;
            }

            if (idInput && nameInput) {
                const idValue = idInput.value.trim();
                const nameValue = nameInput.value.trim();

                if ((idValue === "" && nameValue !== "") || (idValue !== "" && nameValue === "")) {
                    errorMessages.push(`행 ${i}: 이름과 아이디를 함께 입력해야 합니다.`);

                    if (idValue === "" && nameValue !== "") {
                        idInput.style.border = "red";
                        displayErrorMessage(idInput, "아이디를 함께 입력해야 합니다.");
                        return;
                    } else if (idValue !== "" && nameValue === "") {
                        nameInput.style.border = "red";
                        displayErrorMessage(nameInput, " 아이디를 함께 입력해야 합니다.");
                        return;
                    }

                } else if ((idValue === "" && nameValue === "") && (numberInput.value !== "" || totMoneyInput.value !== "" || currentScoreInput.value !== "")) {
                    errorMessages.push(`행 ${i}: 이름 또는 아이디를 입력해야 합니다.`);
                    displayErrorMessage(idInput, "이름과 아이디를 함께 입력해야 합니다.");
                    displayErrorMessage(nameInput, "이름과 아이디를 함께 입력해야 합니다.");
                    return;
                } else if (idValue.includes(" ") || nameValue.includes(" ")) {
                    errorMessages.push(`행 ${i}: 공백 문자는 입력할 수 없습니다.`);
                    displayErrorMessage(idInput, `행 ${i}: 공백 문자는 입력할 수 없습니다.`)
                    displayErrorMessage(nameInput, `행 ${i}: 공백 문자는 입력할 수 없습니다.`)
                    return;

                } else if (idValue !== "" && nameValue !== "") {
                    userVO.push({
                        name: nameValue,
                        number: numberInput.value.trim() || null,
                        id: idValue,
                        totMoney: totMoneyValue|| null,
                        currentScore: totCurrentScoreValue || null
                    });
                }
            }
        }

        if (userVO.length === 0) {
            displayErrorMessage(document.querySelector("#item-1-id"),"입력된 값이 없습니다.")

        } else {
            console.log("하나 이상의 유효한 데이터가 있어서 서버에 전송합니다.");
            sendUserDataToServer(userVO);
        }

        function sendUserDataToServer(userData) {
            fetch('/api/users', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(userData)
            })
                .then(response => {
                    if (response.status === 200 || response.status === 201) {
                        console.log('서버 응답:', response.statusText);
                        // 성공 응답 처리
                        window.location.href = '/';
                    } else if (response.status === 400) {
                        console.error('에러 발생:', response.statusText);
                        response.text().then(errorMessage => {
                            console.error('에러 메시지:', errorMessage); // 중복 id 에러 메시지 출력

                        });
                    } else {
                        console.error('에러 발생:', response.statusText);

                    }
                })
                .catch(error => {
                    console.error('에러 발생:', error);
                });
        }

    }); //addUsers 끝

    function displayErrorMessage(inputElement, errorMessage) {
        const errorElement = document.createElement("div");
        errorElement.className = "error-message";
        errorElement.textContent = errorMessage;
        inputElement.parentNode.appendChild(errorElement); // input 요소의 부모 요소에 추가

        setTimeout(() => {
            errorElement.classList.add("show");
        }, 50); // 애니메이션 효과를 위해 50ms 지연시킴

        setTimeout(() => {
            errorElement.classList.remove("show");
            setTimeout(() => {
                errorElement.remove();
            }, 300);
        }, 3000); // 3초 후에 제거
    }
});
