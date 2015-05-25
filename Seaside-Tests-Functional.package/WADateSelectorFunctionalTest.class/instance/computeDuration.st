actions
computeDuration
	| dateDiff |
	dateDiff := (endDAT dateAndTime asDate - beginDAT dateAndTime asDate) days.
	dateDiff isZero 
		ifFalse: [
			self 
				inform: dateDiff greaseString , ' day(s)'
				onAnswer: [ ] ]
		ifTrue: [
			self 
				inform: (endDAT dateAndTime asTime subtractTime: beginDAT dateAndTime asTime) asSeconds greaseString , ' second(s)'
				onAnswer: [ ] ]