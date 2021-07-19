<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<script src="js/ajaxScript.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>
.sidebar {
  position: fixed;
  top: 0;
  /* rtl:raw:
  right: 0;
  */
  bottom: 0;
  /* rtl:remove */
  left: 0;
  z-index: 100; /* Behind the navbar */
  padding: 48px 0 0; /* Height of navbar */
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
}

.sidebar-sticky {
  position: relative;
  top: 0;
  height: calc(100vh - 48px);
  padding-top: .5rem;
  overflow-x: hidden;
  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
}

.sidebar .nav-link {
  font-weight: 500;
  color: #333;
}

.sidebar .nav-link .feather {
  margin-right: 4px;
  color: #727272;
}

.sidebar .nav-link.active {
  color: #2470dc;
}

.sidebar .nav-link:hover .feather,
.sidebar .nav-link.active .feather {
  color: inherit;
}

.sidebar-heading {
  font-size: .75rem;
  text-transform: uppercase;
}

.side-nav-link{display:block;padding:.5rem 1rem;color:#0d6efd;text-decoration:none;transition:color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out}@media (prefers-reduced-motion:reduce){.nav-link{transition:none}}
.side-nav-link{color: gray;}
.side-nav-link:hover{cursor: pointer;}
.side-active{color:#0d6efd;}

.placeTableContent:hover{background-color: #CCC; cursor: pointer;}
</style>
<script>
function placeEditor(pidx) {
	const form = document.placeForm;
	form.pidx.value = pidx;
	form.submit();
}
function navBarTextColor(target) {
	var links = $('.nav-link');
	links.removeClass('active');
	
	const link = document.getElementById(target.id);
	link.classList.add('active');
}
function sideBarTextColor(target) {
	var links = $('.side-nav-link');
	links.removeClass('side-active');
	
	const link = document.getElementById(target.id);
	link.classList.add('side-active');
}


function putDataIntoArticle(data) {
	const target = document.getElementsByTagName('main')[0];
	target.innerHTML = data;
}
function callPlaceListPage(ridx) {
	if(ridx == 0) {
		window.alert('도시를 선택해주세요');
		return;
	}
	adminPageRidx.value = ridx;
	let params = 'ridx='+ridx;
	sendXHR('placeList.do', params, 'POST', function() {
		if(XHR.readyState == 4) {
			if(XHR.status == 200) {
				putDataIntoArticle(XHR.responseText);
				const target = document.getElementById('sidePlaceList');
				sideBarTextColor(target);
			}
		}
	});
}
function callPlaceAddPage(ridx) {
	let params = 'ridx='+ridx;
	sendXHR('placeAdd.do', params, 'POST', function() {
		if(XHR.readyState == 4) {
			if(XHR.status == 200) {
				putDataIntoArticle(XHR.responseText);
				const target = document.getElementById('sidePlaceEditor');
				sideBarTextColor(target);
			}
		}
	});
}
</script>
</head>
<%@ include file="./adminHeader.jsp" %>
<body class="pt-5">
<section>
<div class="container-fluid">
  <div class="row">
    <%@ include file="./adminSidebar.jsp" %>
    <article><main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"></main></article>
    <input type="hidden" id="adminPageRidx" value="0">
  </div>
</div>
</section>
</body>
</html>