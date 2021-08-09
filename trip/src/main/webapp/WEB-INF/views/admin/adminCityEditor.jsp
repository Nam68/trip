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
				<h1 class="h2">City Editor</h1>
			</div>
			<div>
				<select class="form-select" aria-label="Default select example">
				  	<option ${places==null? 'selected':'' }>Open this select menu</option>
				 	<c:forEach var="c" items="${cities }">
				  	<option ${ridx==c.ridx? 'selected':'' } value="${c.ridx }" class="city-select">${c.kname }</option>
				  	</c:forEach>
				</select>
				<script>
				  	$('.form-select').change(function(){
				  		var ridx = $(this).val();
				  		page_move_with_param('adminCityEditor.do', 'ridx', ridx);
				  	});
				</script>
			</div>
			<div class="container">
				<div class="row g-3 mt-4">
					<div class="col-auto">
						<label for="cityNameInput" class="form-label">City Name</label>
					</div>
					<div class="col-auto">
						<input type="text" class="form-control" placeholder="${city.kname }" id="cityNameInput">
					</div>
					<div class="col-auto">
						<button type="submit" class="btn btn-primary mb-3" id="liveAlertBtn">Confirm</button>
					</div>
				</div>
				<div id="liveAlertPlaceholder"></div>
				<script>
					function myAlert(message) {
					  var wrapper = document.createElement('div');
					  wrapper.innerHTML = '<div class="alert alert-danger alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';		  
					  $('#liveAlertPlaceholder').append(wrapper);
					}
					
					$('#cityNameInput').change(function(){
						$('#liveAlertPlaceholder').empty();
					});
		
					$('#liveAlertBtn').click(function(){
						//경고창이 출력되어 있으면 띄우지 않음
						if($('[role="alert"]').length > 0) {
							return ;
						}
						//빈 칸이면 경고창을 띄움
						if(cityNameInput.value.length == 0) {
							myAlert('변경할 이름을 입력해주세요.');
							return;
						}
						//같은 이름의 도시가 있으면 경고창 출력 후 리턴
						var cities = new Array();
						<c:forEach var="c" items="${cities }">
						cities.push('${c.kname}');
						</c:forEach>
						for(var i = 0; i < cities.length; i++) {
							if(cityNameInput.value == cities[i]) {
								myAlert('같은 이름의 도시가 이미 존재합니다.');
								return;
							}
						}
						
						$.ajax({ 
			  				type: 'GET', 
			  				url: 'adminCityNameChange.do', 
			  				data: {
			  						kname:cityNameInput.value,
			  						ridx:${ridx}
			  					}, 
			  				success: function(data) {
			  					window.alert(data);
			  					location.reload();
			  				}
			  			})
			  			.fail(function(){
			  				window.alert('서버에 이상이 발생했습니다.');
			  			});
					});
				</script>
				<div class="row g-3 mt-4">
					<div class="col-auto">
						<label for="cityNameInput" class="form-label">등록된 관광지 보러가기</label>
					</div>
					<div class="col-auto">
						<button type="submit" class="btn btn-primary mb-3" id="liveAlertBtn">GO</button>
					</div>
				</div>
			</div>
    	</main>
    </article>
  </div>
</div>
</section>
</body>
</html>