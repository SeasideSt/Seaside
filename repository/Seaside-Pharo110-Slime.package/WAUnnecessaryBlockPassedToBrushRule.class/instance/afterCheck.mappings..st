hooks
afterCheck: aNode mappings: dict

	aNode methodNode compiledMethod isRenderingMethod ifFalse:[ ^ false ].
	^ (aNode selector = #with:)
		ifTrue: [ WASlime isBrushSelector: aNode receiver selector ] 
		ifFalse: [ WASlime isBrushSelector: aNode selector ]