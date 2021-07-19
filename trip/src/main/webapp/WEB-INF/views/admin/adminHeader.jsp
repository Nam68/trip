<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            	<a class="dropdown-item" onclick="callPlaceListPage(${city.ridx})">${city.kname }</a>
            </li>
            </c:forEach>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
</header>