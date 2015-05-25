delegation
show: aComponent onAnswer: aBlock
	^ parent isNil
		ifFalse: [ parent parent show: aComponent onAnswer: aBlock ]
		ifTrue: [ super show: aComponent onAnswer: aBlock ]