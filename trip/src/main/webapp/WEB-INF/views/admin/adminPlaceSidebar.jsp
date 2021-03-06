<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
	<div class="position-sticky pt-3">
		<ul class="nav flex-column">
			<li class="nav-item"><a class="side-nav-link ${sidemenu=='list'? 'side-active':'' }">Place List </a></li>
			<li class="nav-item"><a class="side-nav-link ${sidemenu=='add'? 'side-active':'' }">Place Add </a></li>
			<li class="nav-item"><a class="side-nav-link ${sidemenu=='editor'? 'side-active':'' }">Place Editor</a></li>
			<li class="nav-item"><a class="side-nav-link ${sidemenu=='delete'? 'side-active':'' }">Place Delete</a></li>
			<li class="nav-item"><a class="side-nav-link ${sidemenu=='dash'? 'side-active':'' }">Dashboard</a></li>
		</ul>
	</div>
</nav>
<script>
	var ridx = ${ridx};
	$('.flex-column').find('li:eq(0)').click(function(){
		page_move('adminPlaceList.do');
	});
	$('.flex-column').find('li:eq(1)').click(function(){
		page_move_with_param('adminPlaceAdd.do', 'ridx', ridx);
	});
	$('.flex-column').find('li:eq(2)').click(function(){
		window.alert('리스트에서 항목을 선택해주세요.');
		page_move('adminPlaceList.do');
	});
	$('.flex-column').find('li:eq(3)').click(function(){
		page_move_with_param('adminPlaceDelete.do', 'ridx', ridx);
	});
	$('.flex-column').find('li:eq(4)').click(function(){
		page_move('adminPlaceDash.do');
	});
</script>