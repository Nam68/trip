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

<!-- Customs -->
<style>
.cityAddButton{text-align: center; margin-top: 3vh;}
#liveAlertPlaceholder{margin-top: 5vh;}
</style>
</head>
<%@ include file="./adminHeader.jsp" %>
<body class="pt-5">
<section>
<div class="container-fluid">
  <div class="row">
    <%@ include file="./adminCitySidebar.jsp" %>
    <article>
    	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	    	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h2">City Add</h1>
			</div>
			<div class="input-group flex-nowrap">
				<span class="input-group-text" id="addon-wrapping">City Name</span>
				<input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping" id="cityNameInput">
				<button class="btn btn-outline-secondary" type="button" id="duplicationButton">Duplication Check</button>
				<script>
					var nameCheck = false;
					$('#duplicationButton').click(function(){
						var cityName = document.getElementsByClassName('form-control')[0].value;
						if(cityName == null || cityName == '') {
							toastOn('이름을 입력해주세요.');
							return;
						}
						
						var cities = new Array();
						<c:forEach items='${cities}' var='c'>
						cities.push('${c.kname}');
						</c:forEach>
						
						for(var i = 0; i < cities.length; i++) {
							if(cityName == cities[i]) {
								toastOn('같은 이름의 도시가 이미 존재합니다.');
								nameCheck = false;
							} else if(i == cities.length-1) {
								toastOn('사용 가능한 이름입니다.');
								nameCheck = true;
							}
						}
					});
					
					$('#cityNameInput').change(function(){
						nameCheck = false;
					});
				</script>
			</div>
			
			<!-- Alert -->
			<div id="liveAlertPlaceholder"></div>
			<div class="cityAddButton">
				<button type="button" class="btn btn-primary" id="liveAlertBtn">Add</button>			
				<script>
					const alertPlaceholder = document.getElementById('liveAlertPlaceholder');
					
					function myAlert(message) {
					  	var wrapper = document.createElement('div');
					  	wrapper.innerHTML = '<div class="alert alert-danger alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
					
					 	alertPlaceholder.append(wrapper);
					}
					
					$('#liveAlertBtn').click(function(){
						var alertCheck = alertPlaceholder.querySelectorAll('[role="alert"]').length;

				  		if(nameCheck == true || alertCheck != 0) {
				  			$.ajax({ 
				  				type: 'GET', 
				  				url: 'adminCityNameAdd.do', 
				  				data: {kname:$('#cityNameInput').val()}, 
				  				success: function(data) {
				  					
				  					window.alert(data);
				  					location.reload();
				  				}
				  			})
				  			.fail(function(){
				  				window.alert('서버에 이상이 발생했습니다.');
				  			});
				  			return;
				  		}
						myAlert('이름 중복 체크를 완료해주세요.');
					});
				</script>
			</div>
			
			<!-- Toast -->
			<div aria-live="polite" aria-atomic="true" class="d-flex justify-content-center align-items-center w-100">
				<div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
			  		<div class="toast-header">
				    	<strong class="me-auto">Notice</strong>
				    	<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
			    	</div>
			   	 	<div class="toast-body">
			   	 	<!-- Input the Message -->
			   	 	</div>
				</div>
				<script>
					var toastTrigger = document.getElementById('liveToastBtn');
					var toastLiveExample = document.getElementById('liveToast');
					function toastOn(message) {
						document.getElementsByClassName('toast-body')[0].innerHTML = message;
						var toast = new bootstrap.Toast(toastLiveExample);
				      	toast.show();
					}
				</script>
			</div>
			
			
    	</main>
    </article>
  </div>
</div>
</section>
</body>
</html>