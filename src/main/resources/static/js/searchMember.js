function searchUsers() {
    // 검색 조건과 검색어를 얻습니다.
    const searchType = document.querySelector("#searchUser select").value;
    const searchKeyword = document.querySelector("#searchUser input").value;

    // 검색 조건과 검색어를 쿼리 문자열로 만들어 URL에 추가합니다.
    const queryString = `?searchType=${searchType}&searchKeyword=${searchKeyword}`;
    window.location.href = `/search${queryString}`;
}