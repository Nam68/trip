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

<!-- Google Map -->
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<link rel="stylesheet" type="text/css" href="./style.css" />
<script src="./index.js"></script>
<script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPg6sDuTdTWAWj17NeU9JkTVNEs3gJfIU&libraries=&v=weekly&libraries=places&region=KR"></script>
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
    <%@ include file="./adminPlaceSidebar.jsp" %>
    <article>
    	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		    	<h1 class="h2">Place Delete</h1>
			</div>
			<div class="input-group mb-3">
				<button id="citySelectDropdownBtn" class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Choose</button>
					<ul id="citySelectDropdown" class="dropdown-menu">
						<c:forEach var="c" items="${cities }">
				    	<li value="${c.ridx }"><a class="dropdown-item" href="#">${c.kname }</a></li>
				    	</c:forEach>
				  	</ul>
				<button id="citySelectBtn" class="btn btn-outline-primary" type="button">Select</button>
				<script>
					var ridx;
					window.onload = function(){
						ridx = ${ridx};
						
						var cities = new Array();
						<c:forEach var="c" items="${cities}">
						cities.push([${c.ridx}, '${c.kname}']);
						</c:forEach>
						
						for(var i = 0; i < cities.length; i++) {
							if(cities[i][0] == ridx) {
								$('#citySelectDropdownBtn').html(cities[i][1]);
								return;
							}
						}
					}
					
					var cityName;
					$('#citySelectDropdown').find('li').click(function(){
						ridx = $(this).val();
						cityName = $(this).find('a').html();
						
						$('#citySelectDropdownBtn').html(cityName);
					});
					$('#citySelectBtn').click(function(){
						$.ajax({
							type: 'GET',
							url: 'placesInSelectedCity.do',
							data: {ridx: ridx},
							success: function(data) {
								var placeJson = JSON.parse(data);
								for(var i = 0; i < Object.keys(placeJson).length; i++) {
									var liData = '<li value="'+placeJson[i].pidx+'"><a class="dropdown-item" href="#">'+placeJson[i].kname+'</a></li>';
									$('#placeDeleteDropdown').append(liData);
								}
								$('#placeDeletePlacesForm').removeAttr('hidden');
							}
						})
						.fail(function(){
							window.alert('서버에 이상이 생겼습니다.');
						});
					});
				</script>
			</div>
			<div id="placeDeletePlacesForm" class="input-group mb-3" hidden>
				<button id="placeDeleteDropdownBtn" class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">Choose</button>
					<ul id="placeDeleteDropdown" class="dropdown-menu">
					</ul>
				<button id="placeDeleteSubmitBtn" class="btn btn-outline-danger" type="button" data-bs-toggle="modal">Delete</button>
				<script>
					var pidx = 0;
					$('#placeDeleteDropdown').find('li').click(function(){
						
					});
				
				</script>
				<div class="modal fade" id="placeDeleteConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  	<div class="modal-dialog">
				    	<div class="modal-content">
				      		<div class="modal-header">
				        		<h5 class="modal-title" id="cityDeleteConfirmModalLabel">Modal title</h5>
				        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      		</div>
				      		<div class="modal-body">
				        	이 도시와 관련된 모든 정보가 함께 삭제되며, 삭제 후에는 복구할 수 없습니다.<br>삭제하시겠습니까?
				      		</div>
				      		<div class="modal-footer">
				        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				        		<button id="placeDeleteConfirmBtn" type="button" class="btn btn-danger">Delete</button>
				        		<script>
				        			$('#cityDeleteConfirmBtn').click(function(){
				        				$.ajax({
				        					type: 'GET',
				        					url: 'adminCityDelete.do',
				        					data: {ridx: ridx},
				        					success: function(data){
				        						window.alert(data);
				        						location.reload();
				        					}
				        				})
				        				.fail(function(){
				        					window.alert('서버에 이상이 생겼습니다.');
				        				});
				        			});
				        		</script>
				      		</div>
				    	</div>
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