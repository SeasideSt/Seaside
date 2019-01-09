tests-convenience
testSerializeWithHidden
	self
		assert: (self ajax serializeWithHidden: (self jQuery: '#foobar'))
		equals: self function, '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1",' , self function , '("#foobar").next("input:hidden").addBack().serialize()].join("&")})'