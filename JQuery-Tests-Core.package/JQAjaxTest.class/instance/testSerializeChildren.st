tests-convenience
testSerializeChildren
	self
		assert: (self ajax serializeChildren)
		equals: self function , '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1",' , self function , '(this).find(":input").serialize()].join("&")})'.
	self
		assert: (self ajax serializeChildren: (self jQuery: 'form'))
		equals: self function , '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1",' , self function , '("form").find(":input").serialize()].join("&")})'