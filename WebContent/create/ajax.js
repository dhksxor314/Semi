/**
 * 
 */

var httpRequest = null;

function getXMLHttpRequest() {
	return new XMLHttpRequest();
}

function sendRequest(method, url, param, callback) {
	httpRequest = getXMLHttpRequest();

	var httpMethod = method ? method : "GET";
	if (httpMethod != "GET" && httpMethod != "POST") {
		httpMethod = "GET";
	}

	var httpParam = (param == null || param == "") ? null : param;

	var httpUrl=url;
	if(httpMethod=="GET" && httpParam!= null){
		httpUrl=httpUrl+"?"+httpParam;
	}
	httpRequest.open(httpMethod, httpUrl, true);
	httpRequest.setRequestHeader("content-Type", "application/x-www-form-urlencoded; charset=utf-8")
	httpRequest.onreadystatechange=callback;
	httpRequest.send(httpMethod="POST"?httpParam:null);
}