running
checkMethod: aContext
	aContext methodClass isMeta
		ifTrue: [ ^ self ].
	((superSelectors includes: aContext selector)
		and: [ (aContext superMessages includes: aContext selector) not ])
			ifTrue: [ result addClass: aContext methodClass selector: aContext selector ]