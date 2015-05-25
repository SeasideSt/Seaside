tests-convenience
testSerializeThis
	self
		assert: (self ajax serializeThis)
		equals: self function , '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1",' , self function , '(this).serialize()].join("&")})'