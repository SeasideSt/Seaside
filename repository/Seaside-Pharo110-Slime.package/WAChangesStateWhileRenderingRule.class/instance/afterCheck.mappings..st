hooks
afterCheck: aNode mappings: dict

	aNode methodNode compiledMethod isRenderingMethod ifFalse: [ ^ false ].
	aNode isWrite ifFalse: [ ^ false ].
	(WASlime isWithinCallback: aNode) ifTrue:[ ^ false ].

	^ aNode methodNode methodClass instVarNames includes: aNode name