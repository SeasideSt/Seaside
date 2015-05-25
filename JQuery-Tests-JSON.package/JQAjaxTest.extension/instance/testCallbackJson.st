*jquery-tests-json
testCallbackJson
	self
		assert: (self ajax callback: [ :value | ] json: self mock)
		equals: self function , '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1","2="+encodeURIComponent(JSON.stringify(mock))].join("&")})'