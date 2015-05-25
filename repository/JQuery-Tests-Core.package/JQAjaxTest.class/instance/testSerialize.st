tests-convenience
testSerialize
	self
		assert: (self ajax serialize: (self jQuery: 'form'))
		equals: self function , '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1",' , self function , '("form").serialize()].join("&")})'