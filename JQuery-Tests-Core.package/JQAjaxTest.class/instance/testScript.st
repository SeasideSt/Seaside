tests-callbacks
testScript
	self 
		assert: (self ajax script: [ :script | script alert: 'Hello' ])
		equals: self function , '.ajax({"dataType":"script","url":"http://www.seaside.st/","data":["_s=1","_k=a","1"].join("&")})'