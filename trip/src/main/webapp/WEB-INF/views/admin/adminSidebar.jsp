<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 	<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="side-nav-link side-active" aria-current="page" href="#">
              Dashboard
            </a> 
          </li> 
          <li class="nav-item">
            <a class="side-nav-link" id="sidePlaceList" onclick="callPlaceListPage(adminPageRidx.value)">
              Place List
            </a>
          </li> 
          <li class="nav-item">
            <a class="side-nav-link" id="sidePlaceEditor" onclick="callPlaceAddPage(adminPageRidx.value)">
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