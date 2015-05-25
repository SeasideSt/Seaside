callbacks
callback: aBlock value: anObject
	"Register aBlock as a secondary callback. anObject is interpreted as JavaScript on the client-side, the result will be sent back to the server and passed into aBlock. Multiple secondary callbacks can be defined with one receiver."

	aBlock argumentCount = 1
		ifFalse: [ self error: 'aBlock expects one argument' ].
	self addParameter: (self renderContext callbacks
		store: (WAValueCallback on: aBlock)) 
			-> anObject