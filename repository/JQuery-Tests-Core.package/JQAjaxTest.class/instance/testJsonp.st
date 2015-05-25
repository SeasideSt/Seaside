tests-options
testJsonp
	self
		assert: (self ajax jsonp: 'onJsonPLoad')
		equals: self function , '.ajax({"jsonp":"onJsonPLoad"})'