tests-callbacks
testMultiple
	self 
		assert: (self ajax
			callback: [ :value | ] value: $a; 
			callback: [ :value | ] value: $b;
			callback: [ ])
		equals: self function , '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1","2=a","3=b"].join("&")})'