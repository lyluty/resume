var ajax = {};
ajax.xhr = {};
ajax.xhr.Request = function(url, params, callback, method) {
	this.XHR=null;
	this.url = url;
	this.params = params;
	this.callback = callback;
	this.method = method;
	this.send();
};
ajax.xhr.Request.prototype = {
	getXMLHttpRequest : function() {
		if (window.XMLHttpRequest) {
			try {
				return new XMLHttpRequest();
			} catch (e) {
				return null;
			}
		} else{
			return null;
		}
	},
	send : function() {
		this.XHR = this.getXMLHttpRequest();
		var httpMethod = this.method ? this.method : 'GET';
		if (httpMethod != 'GET' && httpMethod != 'POST') {
			httpMethod = 'GET';
		}
		var httpParams = (this.params == null || this.params == '') ? null
				: this.params;
		var httpUrl = this.url;
		if (httpMethod == 'GET' && httpParams != null) {
			httpUrl = httpUrl + "?" + httpParams;
		}
		this.XHR.open(httpMethod, httpUrl, true);
		this.XHR.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		
		var request = this;
		this.XHR.onreadystatechange = function(){
			request.callback(this);
		}
		
		//this.XHR.onreadystatechange=callBack;
		
		this.XHR.send(httpMethod == 'POST' ? httpParams : null);
	}
};
