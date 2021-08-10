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
<script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPg6sDuTdTWAWj17NeU9JkTVNEs3gJfIU&callback=initMap&libraries=&v=weekly&libraries=places&region=KR"></script>

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

<!-- Custom -->
<style>
.placeImgSample{width:200px; height:200px; border-radius:8px; background:#868e96; color:#dee2e6;}
</style>

<style>
#map {width:400px; height:300px; border-radius:8px; border:solid black 1px;}
</style>
<script>
let map;
function initMap() {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 37.344, lng: 126.58 },
    zoom: 8,
  });
}
</script>
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
				<h1 class="h2">Place Add</h1>
			</div>
			<div class="table-responsive">
		      	<div class="input-group mb-3">
				  	<label class="input-group-text" for="inputGroupSelect01">City</label>
				  	<select class="form-select" id="inputGroupSelect01">
				    	<option value="0" ${ridx==0? 'selected':'' }>Choose...</option>
				   	 	<c:forEach var="c" items="${cities }">
				   	 	<option value="${c.ridx }" ${ridx==c.ridx? 'selected':'' }>${c.kname }</option>
				   	 	</c:forEach>
					</select>
				</div>
				<div class="input-group mb-3">
				  	<span class="input-group-text">Name</span>
				  	<input id="placeNameInput" type="text" class="form-control" placeholder="Place Name" aria-label="Username">
			  	</div>
			  	<div class="input-group mb-3">
				  	<span class="input-group-text">Address</span>
				  	<a id="addressCheckBtn" class="btn btn-outline-danger" data-bs-toggle="collapse" href="" role="button" aria-expanded="false" aria-controls="collapseExample">
					    Address Check
					</a>
				  	<input id="placeAddressInput" type="text" class="form-control" placeholder="Address" aria-label="Username">		  	
					<script>
						$('#placeAddressInput').change(function(){
							$('#liveAlertPlaceholder').empty();
							var addr = $(this).val();
							if(addr==null || addr=='') {
								$('#addressCheckBtn').removeAttr('href');
							} else {
								$('#addressCheckBtn').attr('href', '#addressCheckForm');
							}
						});
						
						$('#addressCheckBtn').click(function(){
							var addr = $('#placeAddressInput').val();
							if(addr==null || addr=='') {
								addrAlert('주소 입력창에 정보를 입력해주세요.');
							}
						});
						
						function addrAlert(message) {
							var wrapper = document.createElement('div');
							wrapper.innerHTML = '<div class="alert alert-danger alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
							
							if($('#liveAlertPlaceholder').find('[role="alert"]').length == 0) {
								$('#liveAlertPlaceholder').append(wrapper);	
							}
						}
					</script>
			  	</div>
			  	<div id="liveAlertPlaceholder"></div>
			  	<div class="collapse" id="addressCheckForm">
					<div class="card card-body">
				    	<div class="container">
			  				<div class="row">
				  				<div class="col">
				  					<div id="map"></div>
				  				</div>
				  				<div class="col align-self-center">
				  					<p class="h5 text-center">지도에 표시된 위치가 맞습니까?</p>
				  					<div class="d-grid gap-2 d-md-block text-center">
										<button class="btn btn-primary" type="button">Yes</button>
										<button class="btn btn-outline-danger" type="button">No</button>
									</div>
				  				</div>
			  				</div>
			  			</div>
					</div>
				</div>
			  	<div class="input-group mb-3 mt-3">
					<label class="input-group-text" for="inputGroupFile01">Image</label>
					<input type="file" class="form-control" id="inputGroupFile01">
			  	</div>
			  	<div class="container">
			  		<div class="row">
				  		<div class="col">
				  			<div class="placeImgSample">SAMPLE IMAGE<br>200x200</div>
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