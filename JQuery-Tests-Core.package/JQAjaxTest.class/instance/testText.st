tests-callbacks
testText
	self 
		assert: (self ajax text: [ :stream | stream nextPutAll: 'Supergirl' ])
		equals: self function , '.ajax({"dataType":"text","url":"http://www.seaside.st/","data":["_s=1","_k=a","1"].join("&")})'