const hamburger = document.querySelector("#toggle-btn");

hamburger.addEventListener("click", function () {
	//토글 버튼을 눌렀을 때, 사이드메뉴가 확장되도록 설정함
  document.querySelector("#sidebar").classList.toggle("expand");
});