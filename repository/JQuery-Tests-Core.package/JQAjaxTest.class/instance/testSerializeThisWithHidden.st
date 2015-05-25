tests-convenience
testSerializeThisWithHidden
	self
		assert: (self ajax serializeThisWithHidden)
		equals: self function , '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1",' , self function , '(this).next("input:hidden").addBack().serialize()].join("&")})'