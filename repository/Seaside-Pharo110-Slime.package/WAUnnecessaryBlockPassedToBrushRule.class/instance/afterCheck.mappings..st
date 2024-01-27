hooks
afterCheck: aNode mappings: dict

	aNode methodNode method isRenderingMethod ifFalse:[ ^ false ].
	^ (aNode selector = #with:)
		ifTrue: [ WASlime isBrushSelector: aNode receiver selector ] 
		ifFalse: [ WASlime isBrushSelector: aNode selector ]