tests-callbacks
testCallbackForEvent
	self 
		assert: (self ajax callback: [ ] forEvent: #(
			(passenger tab)
			(number index)
			(position position)
			(size originalSize)
			(string contributor)))
		equals: self function, '.ajax({"url":"http://www.seaside.st/","data":["_s=1","_k=a"',
			',"1="+encodeURIComponent(',
			'$(arguments[1].tab).attr("id")',
				'+","+',
			'arguments[1].index',
				'+","+',
			'arguments[1].position.top+","+arguments[1].position.left',
				'+","+',
			'arguments[1].originalSize.width+","+arguments[1].originalSize.height',
				'+","+',
			'arguments[1].contributor',
				')].join("&")})'