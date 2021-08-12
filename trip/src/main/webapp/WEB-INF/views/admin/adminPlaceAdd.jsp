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

<!-- Custom -->
<style>
.placeImgSample{width:200px; height:200px; border-radius:8px; background:#868e96; color:#dee2e6; display: flex; align-items: center; text-align: center; padding: 70px;}
</style>

<style>
#map {width:400px; height:300px; border-radius:8px; border:solid black 1px;}
</style>
<script>
var map;
var service;
var lat = 0;
var lng = 0;
var formatted_address;
function initMap(addr) {
	  var seoul = new google.maps.LatLng(37.344, 126.58);

	  map = new google.maps.Map(document.getElementById('map'), {center: seoul, zoom: 15});

	  var request = {
	    query: addr,
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
					<div class="form-floating">
						<select class="form-select" id="placeCitySelect">
					    	<option value="0" ${ridx==0? 'selected':'' }>Choose...</option>
				   	 	<c:forEach var="c" items="${cities }">
				   	 	<option value="${c.ridx }" ${ridx==c.ridx? 'selected':'' }>${c.kname }</option>
				   	 	</c:forEach>
					  	</select>
					  	<label for="floatingSelect">City</label>
					  	<script>
					  		var city = ${ridx};
							var name = '';
							var addr = '';
					  		$('#placeCitySelect').change(function(){
					  			city = $(this).val();
					  			if(city == 0) {
					  				$('#placeAddCheckBtn').removeAttr('href');
					  			} else if(city!=null && name!='' && addr!='') {
					  				$('#placeAddCheckBtn').attr('href', '#placeAddCheck');
					  				$('#liveAlertPlaceholder').empty();
					  			}
					  		});
					  	</script>
					</div>
				</div>
				<div class="form-floating mb-3">
					<input type="email" class="form-control" id="placeNameInput" placeholder="Place Name">
					<label for="floatingInput">Place Name</label>
					<script>
						$('#placeNameInput').change(function(){
				  			name = $(this).val();
				  			if(name == '') {
				  				$('#placeAddCheckBtn').removeAttr('href');
				  			} else if(city!=null && name!='' && addr!='') {
				  				$('#placeAddCheckBtn').attr('href', '#placeAddCheck');
				  				$('#liveAlertPlaceholder').empty();
				  			}
				  		});
					</script>
				</div>
			  	<div class="form-floating mb-3">
					<input type="email" class="form-control" id="placeAddressInput" placeholder="Address">
					<label for="floatingInput">Address</label>
					<script>
						$('#placeAddressInput').change(function(){
				  			addr = $(this).val();
				  			if(addr == '') {
				  				$('#placeAddCheckBtn').removeAttr('href');
				  			} else if(city!=null && name!='' && addr!='') {
				  				$('#placeAddCheckBtn').attr('href', '#placeAddCheck');
				  				$('#liveAlertPlaceholder').empty();
				  			}
				  		});
					</script>
				</div>
			  	<div class="input-group mb-3">
					<label class="input-group-text" for="inputGroupFile01">Image</label>
					<input type="file" class="form-control" id="inputGroupFile01">
					<script></script>
			  	</div>
			  	<div class="input-group mb-3">
					<a id="placeAddCheckBtn" class="btn btn-outline-danger" data-bs-toggle="collapse" href="#" role="button" aria-expanded="false" aria-controls="placeAddCheck">
						Check
					</a>
					<script>
						//href="placeAddCheck"
						$('#placeAddCheckBtn').click(function(){
							if($('#liveAlertPlaceholder').find('[role="alert"]').length > 0) {
								return;
							}
							if(city==0 || name==null || name=='' || addr==null || addr=='') {
								var wrapper = document.createElement('div');
								var message = '필수 입력사항을 입력해주세요.';
								wrapper.innerHTML = '<div class="alert alert-danger alert-dismissible" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
								$('#liveAlertPlaceholder').append(wrapper);
							} else {
								$('#placeCheckCity').html($('#placeCitySelect option:selected').html());
								$('#placeCheckName').html(name)
								initMap($('#placeAddressInput').val());
							}
						});
					</script>
			  	</div>
			  	<div id="liveAlertPlaceholder"></div>
			  	<div class="collapse" id="placeAddCheck">
					<div class="card card-body">
						<div class="mt-2 mb-2"><h4>Place Information Check</h4></div>
						<div class="row g-3">
						  	<div class="col-sm">
						   		<h6>City</h6>
						  	</div>
						  	<div class="col-sm-10">
						    	<h5 id="placeCheckCity">City</h5>
						  	</div>
						</div>
						<div class="row g-3">
						  	<div class="col-sm">
						   		<h6>Place Name</h6>
						  	</div>
						  	<div class="col-sm-10">
						    	<h5 id="placeCheckName">Place Name</h5>
						  	</div>
						</div>
						<div class="row g-3">
						  	<div class="col-sm">
						   		<h6>Address</h6>
						  	</div>
						  	<div class="col-sm-10">
						    	<div id="map"></div>
						  	</div>
						</div>
						<div class="row g-3 mt-2">
						  	<div class="col-sm">
						   		<h6>Image</h6>
						  	</div>
						  	<div class="col-sm-10">
						    	<div class="placeImgSample">SAMPLE IMAGE<br>200x200</div>
						  	</div>
						</div>
						<div class="mt-3 mb-5 ">
							<div class="d-grid gap-2 d-md-block">
							  	<button id="placeAddSubmit" class="btn btn-primary" type="button">Submit</button>
							  	<button id="placeAddCancel" class="btn btn-outline-danger" type="button">Cancel</button>
							  	<script>
							  		$('#placeAddSubmit').click(function(){
							  			$.ajax({ 
							  				type: 'GET', 
							  				url: 'adminPlaceAdd.do', 
							  				data: {
							  					ridx:city,
							  					kname:name,
							  					img:'',
							  					lat:lat,
							  					lng:lng,
							  					addr:formatted_address
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
							  		$('#placeAddCancel').click(function(){
							  			location.reload();
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