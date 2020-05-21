accessing
replaceFrom: start to: stop with: replacement startingAt: repStart
	| startIndex endIndex |
	startIndex := start + offset.
	endIndex := stop + offset min: self size.
	startIndex > self size ifFalse: [
		buffer
			replaceFrom: startIndex
			to: endIndex
			with: replacement
			startingAt: repStart ].
		
	stop + offset > self size ifFalse: [ ^ self ].
	
	buffer
		replaceFrom: 1
		to: (stop + offset) \\ self size
		with: replacement
		startingAt: repStart + endIndex - startIndex + 1