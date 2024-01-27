hooks
afterCheck: aNode mappings: dict

	aNode methodNode method isRenderingMethod ifFalse: [ ^ false ].
	(WASlime isWithinCallback: aNode) ifTrue: [ ^ false ].
	^ true