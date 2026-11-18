tests-options
testResponseType
	self
		assert: (self ajax responseType: 'json')
		equals: self function, '.ajax({"xhrFields":{"responseType":"json"}})'.
	self
		assert: (self ajaxSetup responseType: 'json')
		equals: self function, '.ajaxSetup({"xhrFields":{"responseType":"json"}})'.