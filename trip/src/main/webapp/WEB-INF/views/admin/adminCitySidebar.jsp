
<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
	<div class="position-sticky pt-3">
		<ul class="nav flex-column">
			<li class="nav-item"><a class="side-nav-link ${sidemenu=='list'? 'side-active':'' }">City List </a></li>
			<li class="nav-item"><a class="side-nav-link ${sidemenu=='add'? 'side-active':'' }">City Add </a></li>
			<li class="nav-item"><a class="side-nav-link ${sidemenu=='editor'? 'side-active':'' }">City Editor</a></li>
			<li class="nav-item"><a class="side-nav-link ${sidemenu=='dash'? 'side-active':'' }">Dashboard</a></li>
		</ul>
	</div>
</nav>
<script>
	$('.flex-column').find('li:eq(0)').click(function(){
		page_move('adminCityList.do');
	});
	$('.flex-column').find('li:eq(1)').click(function(){
		page_move('adminCityAdd.do');
	});
	$('.flex-column').find('li:eq(2)').click(function(){
		page_move('adminCityEditor.do');
	});
	$('.flex-column').find('li:eq(30)').click(function(){
		page_move('adminCityDash.do');
	});
</script>