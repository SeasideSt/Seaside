tests-callbacks
testCallback
	self 
		assert: (self ajax callback: [ ])
		equals: self function , '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1"].join("&")})'