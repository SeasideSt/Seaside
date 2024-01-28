hooks
afterCheck: aNode mappings: dict

	aNode methodNode method isRenderingMethod ifFalse: [ ^ false ].
	^ (aNode parent isCascade not)
		and: [ (WASlime isBrushSelector: aNode receiver selector)
		and: [ (WASlime isBrushSelector: aNode receiver selector , ':')
		and: [ (WASlime isBrushSelector: aNode methodNode selector) not ] ] ]