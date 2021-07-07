<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Guide</title>
<style>
body {margin: 0; padding: 0; position: relative; overflow: hidden; } 
.mainImg {width: 100%; height: 100vh; }
.mainButton {color: white; font-weight: 800; font-size: 3vw; padding: 2%; width: 13vw; height: 13vw; border: 0.7vw solid white; transition: all 0.3s; position: absolute; top: 40vh; left: 60vw;}
.mainButton:hover {cursor: pointer; color: darkblue; border: 0.7vw solid darkblue; }
.mainButton>div {margin: 0 auto; margin-top: 12%; font-size: 1.8vw; font-weight: 400; text-align: center; }
.backDiv {position: fixed; top: 0; left: 0; width: 100%; height: 100%; transition: all 0.3s; }


.modal_back {z-index: 100; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.6); transition: all 0.3s; display: none;}
.modal {z-index: 110; position: fixed; background: white; transition: all 0.3s; display: none; }
.modal_close {position: absolute; top: 3%; right: 3%; font-size: 1vh; font-weight: 800; }
.modal_close:hover {cursor: pointer; }

#place_modal {width: 40vw; height: 30vh; top: 35vh; left: 30vw; border: 2px solid black; overflow: hidden; font-size: 3vh;}
#place_modal>div {margin: 3.5% auto; text-align: center;}
.place_modal_input {width: 40%; font-size: 3vh;}
.place_modal_button {width: 30%; padding: 2%; border: 1px solid black; border-radius: 0.8vw; background-color: #87CEEB; }
.place_modal_button:hover {cursor: pointer; background-color: #33AADD; }
</style>
<script>
function mainButtonChange() {
	const back = document.getElementsByClassName('backDiv')[0];
	const div = document.getElementsByClassName('mainButton')[0];
	
	div.style.background = 'rgb(255,255,255)';
	back.style.background = 'rgb(255,255,255)';
	
	window.setTimeout('pageMove()', 300);
}
function pageMove() {
	location.href='main.do';
}

function placeModalOn() {
	modal_back.style.display = 'block';
	place_modal.style.display = 'block';
}
function placeModalClose() {
	modal_back.style.background = 'rgba(0,0,0,0)';
	place_modal.style.top = '50vh';
	place_modal.style.left = '50vw';
	place_modal.style.width = '0%';
	place_modal.style.height = '0%';
	
	window.setTimeout('placeModalDelete()', 280);
}
function placeModalDelete() {
	modal_back.style.display = 'none';
	place_modal.style.display = 'none';
}
function placeModalSubmit() {
	const placeInput = document.getElementsByClassName('place_modal_input')[0];
	let place = placeInput.value;
	placeModalDelete();
	placeInput.value = '';
	
	window.setTimeout('mainButtonChange()', 300);
}
</script>
</head>
<body>
<div class="modal_back" id="modal_back"></div>
<div class="modal" id="place_modal">
	<span class="modal_close" onclick="placeModalClose()">X</span>
	<div>여행지를 선택해주세요</div>
	<div>
		<select class="place_modal_input">
			<c:forEach var="city" items="${cities }">
			<option value="${city.ridx }">${city.kname }</option>
			</c:forEach>
		</select>
	</div>
	<div class="place_modal_button">
		<div class="ok_button" onclick="placeModalSubmit()">OK</div>
	</div>
</div>
<div class="backDiv"></div>
<div class="mainButton" onclick="placeModalOn()">
	TRAVEL<br>GUIDE<br>
	<div>Click Here</div>
</div>
<img class="mainImg" alt="main" src="http://www.myyk.co.kr/img/airplane.jpg">
</body>
</html>