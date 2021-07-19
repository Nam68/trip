let XHR = null;

function getXHR() {
	if(window.ActiveXObject) {	
		return new ActiveXObject('Msxml2.XMLHTTP');
	} else if(window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else {
		return null;
	}
}

function sendXHR(url, params, method, callback) {
	XHR = getXHR();
	
	let newMethod = method.length==0? 'GET':method;
	if(newMethod != 'GET' && newMethod != 'POST') {
		newMethod = 'GET';
	}
	
	let newParams = (params==null||params=='')? null:params;
	let newUrl = url;
	if(newMethod=='GET' && newParams!=null) {
		newUrl = newUrl+'?'+newParams;
	}
	
	XHR.onreadystatechange = callback;
	XHR.open(newMethod, newUrl, true);
	XHR.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	XHR.send(newMethod=='POST'? newParams:null);
}

function sendXHRwithFile(url, params, callback) {
	XHR = getXHR();
	XHR.onreadystatechange = callback;
	XHR.open('POST', url, true);
	XHR.send(params);
}

function sendXHRwithJSON(url, params, callback) {
	XHR = getXHR();
	XHR.onreadystatechange = callback;
	XHR.open('POST', url);
	XHR.setRequestHeader('Content-Type', 'application/json');
	let jsonData = JSON.stringify(params);
	XHR.send(jsonData);
}