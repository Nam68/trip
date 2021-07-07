<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<script src="http://myyk.co.kr/js/ajaxScript.js"></script>
<style>
.header {position: fixed; top: 0; left: 0; width: 100%; height: 0vh; background-color: pink; transition: all 0.3s; }

.aside {position: fixed; top: 5vh; right: 0; width: 0vh; height: 75vh; z-index: 30; background-color: skyblue; transition: all 0.3s; }
.asideHideButton {position: absolute; top: 3%; left: -11.8%; background-color: #E0E0E0; padding: 3%; border-radius: 0.5vh 0 0 0.5vh; color: white; font-size: 3vh; font-weight: 800;}
.asideHideButton:hover {background-color: gray; cursor: pointer; }

.footer {position: fixed; bottom: 0; left: 0; width: 100%; height: 0vh; background-color: orange; transition: all 0.3s; }
</style>
<script>
window.onload = function() {
	window.setTimeout('divSetting()', 500);
}
function divSetting() {
	const header = document.getElementsByClassName('header')[0];
	const aside = document.getElementsByClassName('aside')[0];
	const footer = document.getElementsByClassName('footer')[0];
	
	header.style.height = '5vh';
	aside.style.width = '37vh';
	footer.style.height = '20vh';
}
function asideToggle() {
	const aside = document.getElementsByClassName('aside')[0];
	const asideButton = document.getElementsByClassName('asideHideButton')[0];
	if(asideButton.innerHTML == '&gt;') {
		aside.style.right = '-37vh';
		asideButton.innerHTML = '&lt;';
	} else {
		aside.style.right = '0';
		asideButton.innerHTML = '&gt;';
	}
}
</script>
</head>
<body>
<div class="header"></div>
<div class="aside">
	<div class="asideHideButton" onclick="asideToggle()">></div>
</div>
<div class="footer"></div>
</body>
</html>