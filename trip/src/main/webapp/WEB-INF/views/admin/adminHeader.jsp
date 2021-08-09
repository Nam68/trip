<script>
	function page_move(url) {
	    var form = document.createElement('form');
	    form.action = url;
	    form.method = 'post';
	    document.body.appendChild(form);
	    form.submit();
	}
	function page_move_with_param(url, name, param) {
	    var form = document.createElement('form');
	    var input = document.createElement('input');
	
	    form.action = url;
	    form.method = 'post';
	    
        input.setAttribute('type', 'hidden');
        input.setAttribute('name', name);
        input.setAttribute('value', param);
        
        form.appendChild(input);
	    
	    document.body.appendChild(form);
	    form.submit();
	}
	function page_move_with_params(url, names, params) {
		var form = document.createElement('form');
		form.action = url;
	    form.method = 'post'; 
	    
	    for(var i = 0; i < names.length; i++) {
			var input = document.createElement('input');
			input.setAttribute('type', 'text');
	        input.setAttribute('name', names[i]);
	        input.setAttribute('value', params[i]);
	        form.appendChild(input);
		}
	    
	    document.body.appendChild(form);
	    form.submit();
	}
</script>
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
          <a class="nav-link ${menu=='home'? 'active':'' }" href="#" id="navHome">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${menu=='user'? 'active':'' }" href="#" id="navSetting">User</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${menu=='notice'? 'active':'' }" href="#" id="navManage">Notice</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${menu=='qna'? 'active':'' }" href="#" id="navManage">QnA</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${menu=='city'? 'active':'' }" href="#" id="navManage">City</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link ${menu=='place'? 'active':'' } dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Place
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          	<c:forEach var="city" items="${cities }">
            <li>
            	<a class="dropdown-item" href="#">${city.kname }</a>
            	<input type="hidden" value="${city.ridx }">
            </li>
            </c:forEach>
          </ul>
        </li>
      </ul>
      <script>
      	$('.navbar-nav').find('li:eq(0)').click(function(){
      		page_move('adminPage.do');
      	});
		$('.navbar-nav').find('li:eq(1)').click(function(){
		      		
		});
		$('.navbar-nav').find('li:eq(2)').click(function(){
				
		});
		$('.navbar-nav').find('li:eq(3)').click(function(){
				
		});
		$('.navbar-nav').find('li:eq(4)').click(function(){
			page_move('adminCityList.do');	
		});
		$('.dropdown').find('li').click(function(){
			var ridx = $(this).find('input').val();
			page_move_with_param('adminPlaceList.do', 'ridx', ridx);
		});
      </script>
    </div>
  </div>
</nav>
</header>