running
checkMethod: aContext
	aContext selectedClass isMeta
		ifTrue: [ ^ self ].
	((superSelectors includes: aContext selector)
		and: [ (aContext superMessages includes: aContext selector) not ])
			ifTrue: [ result addClass: aContext selectedClass selector: aContext selector ]