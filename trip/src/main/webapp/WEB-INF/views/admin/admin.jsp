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
</script>
</head>
<body class="pt-5">

<header>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.do">Travel Guide</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#" id="navHome" onclick="navBarTextColor(this)">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" id="navSetting" onclick="navBarTextColor(this)">Setting</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" id="navManage" onclick="navBarTextColor(this)">City Manage</a>
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
</header>
<section>
<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="side-nav-link side-active" aria-current="page" href="#">
              Dashboard
            </a> 
          </li> 
          <li class="nav-item">
            <a class="side-nav-link" id="sidePlaceList" onclick="sideBarTextColor(this)">
              Place List
            </a>
          </li> 
          <li class="nav-item">
            <a class="side-nav-link" id="sidePlaceEditor" onclick="sideBarTextColor(this)">
              Place Editor
              <form name="placeEditorForm" action="placeEditor" method="post"></form>
            </a>
          </li>
          <li class="nav-item">
            <a class="side-nav-link" id="sideCityEditor" onclick="sideBarTextColor(this)">
              City Editor
            </a>
            
          </li>
        </ul>
      </div>
    </nav>

	<article>
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Place List</h1>
      </div>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">#</th>
			  <th scope="col">Name</th>
			  <th scope="col">Address</th>
            </tr>
          </thead>
          <tbody>
	         	<form name="placeForm" action="placeEditor.do" method="post">
	         	<input type="hidden" name="pidx">
	         	</form>
          	<c:forEach var="p" items="${placeList }">
            <tr class="placeTableContent" onclick="placeEditor(${p.pidx})">
              <td>${p.pidx }</td>
              <td>${p.kname }</td>
              <td>${p.addr }</td>
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
    </main>
    </article>
  </div>
</div>
</section>
</body>
</html>