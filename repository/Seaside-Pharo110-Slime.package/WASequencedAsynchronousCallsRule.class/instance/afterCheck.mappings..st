hooks
afterCheck: aNode mappings: dict

	| owner |
	aNode methodNode compiledMethod isRenderingMethod ifFalse:[ ^ false ].
	owner := aNode isCascaded
		ifTrue: [ aNode parent parent ]
		ifFalse: [ aNode parent ].
	^ (owner notNil and: [ owner isMessage and: [ owner selector = #, ] ])