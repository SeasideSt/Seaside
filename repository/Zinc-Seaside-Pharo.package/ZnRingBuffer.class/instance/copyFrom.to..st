accessing
copyFrom: start to: stop
	| copy endIndex copySize |
	copySize := stop - start + 1.
	copy := buffer species new: copySize.
	endIndex := copySize min: self size - start - offset + 1.
	copy
		replaceFrom: 1
		to: endIndex
		with: buffer
		startingAt: start + offset.
		
	stop + offset > self size ifFalse: [ ^ copy ].
	
	^ copy
		replaceFrom: endIndex + 1
		to: copySize
		with: buffer
		startingAt: 1