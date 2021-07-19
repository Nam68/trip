<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	<h1 class="h2">Place Add</h1>
  </div>
  <div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">City</label>
    <div class="col-sm-10">
      <select class="form-select" aria-label="Default select example" id="placeAddCity">
	      <c:forEach var="city" items="${cities }">
		    <option value="${city.ridx }" ${ridx==city.ridx? 'selected':'' }>${city.kname }</option>
		  </c:forEach>
	  </select>
    </div>
  </div>
  <div class="mb-3 row">
    <label for="placeAddKname" class="col-sm-2 col-form-label">Name</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="placeAddKname" value="email@example.com">
    </div>
  </div>
  <div class="mb-3 row">
    <label for="inputPassword" class="col-sm-2 col-form-label">Address</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="placeAdd" value="email@example.com">
    </div>
  </div>