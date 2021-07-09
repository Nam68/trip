<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Guide</title>
<script src="http://myyk.co.kr/js/ajaxScript.js"></script>
<style>
body {margin: 0; padding: 0; position: relative; overflow: hidden; } 
.mainImg {width: 100%; height: 100vh; }
.adminIcon {position: absolute; top: 1%; right: 1%; height: 4vh; width: 5vh; }
.adminIcon:hover {cursor: pointer; }
.mainButton {color: white; font-weight: 800; font-size: 3vw; padding: 2%; width: 13vw; height: 13vw; border: 0.7vw solid white; transition: all 0.3s; position: absolute; top: 40vh; left: 60vw;}
.mainButton:hover {cursor: pointer; color: darkblue; border: 0.7vw solid darkblue; }
.mainButton>div {margin: 0 auto; margin-top: 12%; font-size: 1.8vw; font-weight: 400; text-align: center; }
.backDiv {position: fixed; top: 0; left: 0; width: 100%; height: 100%; transition: all 0.3s; }


.modal_back {z-index: 100; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.6); transition: all 0.3s; display: none;}
.modal {top: 50vh; left: 50vw; width: 0%; height: 0%; z-index: 110; position: fixed; background: white; transition: all 0.3s; display: none; }
.modal_close {position: absolute; top: 3%; right: 3%; font-size: 2.5vh; font-weight: 800; }
.modal_close:hover {cursor: pointer; }

#place_modal {border: 2px solid black; overflow: hidden; font-size: 3vh;}
#place_modal>div {margin: 3.5% auto; text-align: center;}
.place_modal_input {width: 40%; font-size: 3vh;}

#admin_modal {border: 2px solid black; overflow: hidden; font-size: 3vh;}
#admin_modal div {margin: 3.5% auto; text-align: center;}

.modal_submit_button {width: 30%; padding: 2%; border: 1px solid black; border-radius: 0.8vw; background-color: #87CEEB; }
.modal_submit_button:hover {cursor: pointer; background-color: #33AADD; }
</style>
<!-- 모달 관련 -->
<script>
function modalOn(target, width, height, top, left) {
	const modal = document.getElementById(target);
	modal_back.style.display = 'block';
	modal.style.display = 'block';
	window.setTimeout('modalResize(\''+target+'\', \''+width+'\', \''+height+'\', \''+top+'\', \''+left+'\')', 10);
}
function modalResize(target, width, height, top, left) {
	const modal = document.getElementById(target);
	modal_back.style.background = 'rgba(0,0,0,0.6)';
	modal.style.width = width;
	modal.style.height = height;
	modal.style.top = top;
	modal.style.left = left;
}
function modalClose(target, callback) {
	modal_back.style.background = 'rgba(0,0,0,0)';
	target.style.top = '50vh';
	target.style.left = '50vw';
	target.style.width = '0%';
	target.style.height = '0%';
	window.setTimeout(callback, 280);
}
</script>

<script>
function mainButtonChange() {
	const back = document.getElementsByClassName('backDiv')[0];
	const div = document.getElementsByClassName('mainButton')[0];
	
	div.style.background = 'rgb(255,255,255)';
	back.style.background = 'rgb(255,255,255)';
}

function placeModalOn() {
	modalOn('place_modal', '40vw', '30vh', '35vh', '30vw');
}
function placeModalClose() {
	modalClose(place_modal, 'placeModalDelete()');
}
function placeModalDelete() {
	modal_back.style.display = 'none';
	place_modal.style.display = 'none';
	placeInput.value = '';
}
function placeModalSubmit() {
	const placeInput = document.getElementsByClassName('place_modal_input')[0];
	let place = placeInput.value;
	placeModalClose();
	
	window.setTimeout('mainButtonChange()', 300);
	window.setTimeout('pageMove('+place+')', 300);
}
function pageMove(ridx) {
	window.alert(ridx);
	//location.href='main.do?ridx='+ridx;
}


function adminLoginModalOn() {
	modalOn('admin_modal', '40vw', '40vh', '30vh', '30vw');
}
function adminLoginModalClose() {
	modalClose(admin_modal, 'adminLoginModalDelete()');
}
function adminLoginModalDelete() {
	modal_back.style.display = 'none';
	admin_modal.style.display = 'none';
	document.login.id.value = '';
	document.login.pwd.value = '';
}
function adminLoginModalSubmit() {
	let id = document.login.id.value;
	let pwd = document.login.pwd.value;
	let params = 'id='+id+'&pwd='+pwd;
	sendXHR('adminLogin.do', params, adminLoginResult, 'POST');
}
function adminLoginResult() {
	if(XHR.readyState == 4) {
		if(XHR.status == 200) {
			let data = XHR.responseText;
			
			if(data == -1) {
				window.alert('아이디와 비밀번호를 확인해주세요');
			} else if(data == 0) {
				window.alert('관리자 아이디만 로그인 가능합니다');
			} else {
				window.alert('환영합니다');
				adminLoginModalClose();
				mainButtonChange();
				window.setTimeout('adminPageMove()', 300);
			}
			
		}
	}
}
function adminPageMove() {
	const form = document.adminPage;
	form.submit();
}
</script>
</head>
<body>
<!-- 모달창 -->
<div class="modal_back" id="modal_back"></div>
<!-- 여행지 선택 모달창 -->
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
	<div class="modal_submit_button">
		<div class="ok_button" onclick="placeModalSubmit()">OK</div>
	</div>
</div>
<!-- 관리자 로그인 모달창 -->
<div class="modal" id="admin_modal">
	<span class="modal_close" onclick="adminLoginModalClose()">X</span>
	<div>Admin Login</div>
	<form name="login">
	<div>
		<div>
			<label><span>ID</span>
			<input type="text" name="id">
			</label>
		</div>
		<div>
			<label><span>PW</span>
			<input type="password" name="pwd">
			</label>
		</div>
	</div>
	</form>
	<div class="modal_submit_button">
		<div class="ok_button" onclick="adminLoginModalSubmit()">OK</div>
	</div>
</div>

<div class="backDiv"></div>
<div class="mainButton" onclick="placeModalOn()">
	TRAVEL<br>GUIDE<br>
	<div>Click Here</div>
</div>
<img class="mainImg" alt="main" src="http://www.myyk.co.kr/img/airplane.jpg">
<img onclick="${sessionScope.userDTO.userid != 'admin'? 'adminLoginModalOn()':'document.adminPage.submit()' }" class="adminIcon" alt="adminIcon" src="http://www.myyk.co.kr/img/png-clipart-computer-icons-gear-symbol-miscellaneous-cogwheel.png">
<form name="adminPage" action="adminPage.do" method="post"></form>
</body>
</html>