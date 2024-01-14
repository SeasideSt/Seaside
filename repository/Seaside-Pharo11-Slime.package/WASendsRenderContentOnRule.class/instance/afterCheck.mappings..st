hooks
afterCheck: aNode mappings: dict

	aNode methodNode selector = #visitPainter ifTrue: [ ^ false ].
	
	^ (aNode receiver isVariable and: [ aNode receiver name = 'super' ]) not