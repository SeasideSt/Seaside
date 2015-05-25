tests-callbacks
testCallbackValue
	self 
		assert: (self ajax callback: [ ] value: (self jQuery this hasClass: 'foo'))
		equals: self function , '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1","2="+encodeURIComponent(' , self function , '(this).hasClass("foo"))].join("&")})'