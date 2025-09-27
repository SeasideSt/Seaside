tests-callbacks
testMultiple
	self 
		assert: (self ajax
			callback: [ :value | ] value: $a; 
			callback: [ :value | ] value: $b;
			callback: [ ])
		equals: self function, '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a","1=a","2=b","3"].join("&")})'.
	self 
		assert: (self ajax
			html: [ :html | html div ];
			script: [ :script | script refresh ])
		equals: self function, '.ajax({"dataType":"script","url":"http://www.seaside.st/","data":["_s=1","_k=a","1","2"].join("&")})'.
