<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <button type="button" class="btn btn-outline-primary" onclick="callPlaceAddPage(${ridx})">Place Add</button>
      </div>