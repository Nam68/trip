<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>
.placeTableRow:hover {cursor: pointer; background-color: gray; }
</style>
</head>
<body class="pt-5">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.do">Travel Guide</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Setting</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">City Manage</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Cities
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          	<c:forEach var="city" items="${cities }">
            <li>
            	<a class="dropdown-item" onclick="document.citySelectForm.submit()">${city.kname }</a>
            	<form name="citySelectForm" action="citySelected.do" method="post"><input type="hidden" name="ridx" value="${city.ridx }"></form>
            </li>
            </c:forEach>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="col col-lg-2 fixed-top pt-5 mt-5">
	<nav class="nav flex-column nav-pills">
	  <a class="nav-link active" aria-current="page" href="#">Place List</a>
	  <a class="nav-link" href="#">Place Manage</a>
	  <a class="nav-link" href="#">Added Place</a>
	</nav>
</div>
<div class="row pt-5">
	<div class="col col-lg-2"></div>
	<div class="col ps-5">
		<div class="col col-lg-7 mx-auto">
			<h1>Place List</h1>
			<table class="table table-striped">
			  <thead>
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">Name</th>
			      <th scope="col">Address</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach var="place" items="${placeList }">
			    <tr class="placeTableRow">
			    <form name="placeSelect" action="placeSelected.do" method="post">
			      <th scope="row">${place.pidx }<input type="hidden" name="pidx" value="${place.pidx }"></th>
			      <td>${place.kname }</td>
			      <td>${place.addr }</td>
			    </form>
			    </tr>
			    </c:forEach>
			  </tbody>
			  <tfoot>
			  	<tr>
			  	  <td colspan="3">
				  	<nav aria-label="..." class="nav justify-content-center">
					  <ul class="pagination">
					    <li class="page-item disabled">
					      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item active" aria-current="page">
					      <a class="page-link" href="#">2</a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item"> 
					      <a class="page-link" href="#">Next</a>
					    </li>
					  </ul>
					</nav>
			  	  </td>
			  	</tr>
			  </tfoot>
			</table>
		</div>
	</div> 
</div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>