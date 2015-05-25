tests-convenience
testSerializeForm
	self
		assert: (self ajax serializeForm)
		equals: self function , '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1",' , self function , '(this).closest("form").find(":input").serialize()].join("&")})'.
	self
		assert: (self ajax serializeForm: (self jQuery: '#something'))
		equals: self function , '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1",' , self function , '("#something").closest("form").find(":input").serialize()].join("&")})'