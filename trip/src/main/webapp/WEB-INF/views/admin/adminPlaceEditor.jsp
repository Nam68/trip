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

<!-- custom -->
<style>
.v-center{display: flex; align-items: center;}
.placeImgSample{width:200px; height:200px; border-radius:8px; background:#868e96; color:#dee2e6; display: flex; align-items: center; text-align: center; padding: 70px;}
</style>
<style>
#map {width:400px; height:300px; border-radius:8px; border:solid black 1px;}
</style>
<script>
	var map;
	var service;
	var lat;
	var lng;
	var formatted_address;
	function initMap() {
		var location = new google.maps.LatLng(${place.lat}, ${place.lng});
	  	map = new google.maps.Map(document.getElementById('map'), {center: location, zoom: 15});
	  	var marker = new google.maps.Marker({
            position: location, 
            map: map
        });
    	marker.setAnimation(google.maps.Animation.BOUNCE);
	}
	function checkMap(search) {
		var request = {
			    query: search,
			    fields: ['name', 'geometry', 'formatted_address']
			  };
		var service = new google.maps.places.PlacesService(map);
		
		service.findPlaceFromQuery(request, function(results, status) {
		  	if (status === google.maps.places.PlacesServiceStatus.OK) {
		  		var position = results[0].geometry.location;
		    	var marker = new google.maps.Marker({
	                position: position, 
	                map: map
	            });
		    	marker.setAnimation(google.maps.Animation.BOUNCE);
		     	map.setCenter(position);
		     	
		     	lat = results[0].geometry.location.lat();
		     	lng = results[0].geometry.location.lng();
		     	formatted_address = results[0].formatted_address;
		    }
		  });
	}
	
	function updateAjax(params) {
		$.ajax({
			type: 'GET',
			url: 'placeEditor.do',
			data: params,
			success: function(data){
				window.alert(data);
				location.reload();
			}
		})
		.fail(function(){
			window.alert('서버에 이상이 발생했습니다.');
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
		    	<h1 class="h2">Place Editor</h1>
			</div>
			<div class="container">
			  <div class="row">
			    <div class="col-2"><h5>City</h5></div>
			    <div class="col">
			    	<div class="row gx-5">
			    		<div class="col-auto">
			    			<select id="placeCityEditSelect" class="form-select" disabled>
							  	<option value="0" ${place.ridx==0? 'selected':'' }>Choose...</option>
				   	 			<c:forEach var="c" items="${cities }">
				   	 			<option value="${c.ridx }" ${place.ridx==c.ridx? 'selected':'' }>${c.kname }</option>
				   	 			</c:forEach>
							</select>
			    		</div>
			    		<div class="col-auto">
			    			<button id="placeCityEditBtn" type="button" class="btn btn-outline-secondary">Edit</button>
			    			<button id="placeCitySubmitBtn" type="button" class="btn btn-outline-danger" style="display:none;">Submit</button>
			    			<script>
			    				$('#placeCityEditBtn').click(function(){
			    					$('#placeCitySubmitBtn').toggle();
			    					
			    					const select = $('#placeCityEditSelect');
			    					if(select.attr('disabled')) {
			    						select.removeAttr('disabled');	
			    					} else {
			    						select.attr('disabled', 'disabled');
			    					}
			    				});
			    				
			    				$('#placeCitySubmitBtn').click(function(){
			    					var ridx = $('#placeCityEditSelect').val();
			    					if(ridx==0) window.alert('도시를 선택해주세요.'); return;
			    					
			    					var params = {ridx: ridx};
			    					updateAjax(params);
			    				});
			    			</script>
			    		</div>
			    	</div>
			    </div>
			  </div>
			</div>
			<div class="container mt-3">
			  <div class="row">
			    <div class="col-2"><h5>Place Name</h5></div>
			    <div class="col">
			    	<div class="row gx-5">
			    		<div class="col-auto">
			    			<input id="placeNameEditInput" class="form-control" type="text" value="${place.kname }" readonly>
			    		</div>
			    		<div class="col-auto">
			    			<button id="placeNameEditBtn" type="button" class="btn btn-outline-secondary">Edit</button>
			    			<button id="placeNameSubmitBtn" type="button" class="btn btn-outline-danger" style="display:none;">Submit</button>
			    			<script>
			    				$('#placeNameEditBtn').click(function(){
			    					$('#placeNameSubmitBtn').toggle();
			    					
			    					const nameInput = $('#placeNameEditInput');
			    					if(nameInput.attr('readonly')) {
			    						nameInput.removeAttr('readonly');	
			    					} else {
			    						nameInput.attr('readonly', 'readonly');
			    					}
		    					});
			    				
			    				$('#placeNameSubmitBtn').click(function(){
			    					var kname = $('#placeNameEditInput').val();
			    					if(kname==null || kname=='') window.alert('이름을 입력해주세요.') return;
			    					
			    					var params = {kname: kname};
			    					updateAjax(params);
			    				});
			    			</script>
			    		</div>
			    	</div>
			    </div>
			  </div>
			</div>
			<div class="container mt-3">
			  <div class="row">
			    <div class="col-2"><h5>Address</h5></div>
			    <div class="col">
			    	<div class="row gx-5">
			    		<div class="col-auto">
			    			<button id="placeAddressEditBtn" type="button" class="btn btn-outline-secondary" data-bs-toggle="collapse" data-bs-target="#placeAddressEditForm" aria-expanded="false">Edit</button>			    			
							<div class="collapse" id="placeAddressEditForm">
			  					<div class="card card-body mt-2">
			    					<div id="map"></div>
			    					<div class="input-group mt-3 mb-3">
									  	<input id="placeAddressCheckInput" type="text" class="form-control" placeholder="Place's Address" aria-label="Recipient's username" aria-describedby="button-addon2">
									  	<button id="placeAddressCheckBtn" class="btn btn-outline-secondary" type="button" id="button-addon2">Check</button>
									  	<button id="placeAddressSubmitBtn" type="button" class="btn btn-outline-danger">Submit</button>
									  	<script>
											$('#placeAddressEditBtn').click(function(){
												initMap();
											});
									  		$('#placeAddressCheckBtn').click(function(){
									  			checkMap($('#placeAddressCheckInput').val());
									  		});
									  		$('#placeAddressSubmitBtn').click(function(){
									  			if(formatted_address==null || formatted_address==''){
									  				window.alert('주소를 입력해주세요.');
									  				return;
									  			}
									  			var params = {
									  				lat: lat,
									  				lng: lng,
									  				addr: formatted_address
									  			};
									  			updateAjax(params);
									  		});
									  	</script>
									</div>
			  					</div>
							</div>
			    		</div>
			    	</div>
			    </div>
			  </div>
			</div>
			<div class="container mt-3">
			  <div class="row">
			    <div class="col-2"><h5>Image</h5></div>
			    <div class="col">
			    	<div class="row gx-5">
			    		<div class="col-auto">
			    			<button type="button" class="btn btn-outline-secondary" data-bs-toggle="collapse" data-bs-target="#placeImageEditForm" aria-expanded="false">Edit</button>
			    			<div class="collapse" id="placeImageEditForm">
			  					<div class="card card-body mt-2">
			    					<div class="card card-body mt-2">
			    					<div class="placeImgSample">SAMPLE IMAGE<br>200x200</div>
			    					<div class="input-group mt-3 mb-3">
									  	<input type="file" class="form-control" id="placeImgUpload" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
									  	<button id="placeImgSubmitBtn" type="button" class="btn btn-outline-danger">Submit</button>
									  	<script>
										  	$('#placeImgSubmitBtn').click(function(){
										  		var img = $('#placeImgUpload').src;
										  		window.alert(img);
										  		var params = {img: img};
										  		updateAjax(params);
										  	});
									  	</script>
									</div>
			  					</div>
			  					</div>
							</div>
			    		</div>
			    	</div>
			    </div>
			  </div>
			</div>
			<div class="mt-5">
				<button type="button" class="btn btn-danger">Go to List</button>
			</div>
    	</main>
    </article>
  </div>
</div>
</section>
</body>
</html>