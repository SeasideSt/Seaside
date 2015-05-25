tests-accessing
testJavascriptUrl
	self 
		assert: (self ajax javascriptUrl)
		equals: '"/"'.
	self
		assert: (self ajax callback: [ ]; javascriptUrl)
		equals: '"http://www.seaside.st/"+"?"+["_s=1","_k=a","1"].join("&")'.
	self
		assert: (self ajax callback: [ ] value: $a; javascriptUrl)
		equals: '"http://www.seaside.st/"+"?"+["_s=1","_k=a","1","2=a"].join("&")'.
	self
		assert: (self ajax callback: [ ] value: self mock; javascriptUrl)
		equals: '"http://www.seaside.st/"+"?"+["_s=1","_k=a","1","2="+encodeURIComponent(mock)].join("&")'