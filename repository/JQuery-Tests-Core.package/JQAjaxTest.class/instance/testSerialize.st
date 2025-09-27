tests-convenience
testSerialize
	self
		assert: (self ajax serialize: (self jQuery: 'form'))
		equals: self function, '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a",' , self function , '("form").serialize()].join("&")})'