running
checkMethod: aContext
	| matches |
	aContext isRenderingMethod 	
		ifFalse: [ ^ self ].
	matches := matcher 
		executeTree: aContext parseTree
		initialAnswer: OrderedCollection new.
	matches do: [ :each | 
		result 
			addClass: aContext methodClass
			selector: aContext selector.
		result addSearchString: each selector ]