Class {
	#name : 'WAUnnecessaryWithSentToBrushRule',
	#superclass : 'GRReSlimeParseTreeLintRule',
	#category : 'Seaside-Pharo110-Slime',
	#package : 'Seaside-Pharo110-Slime'
}

{ #category : 'hooks' }
WAUnnecessaryWithSentToBrushRule >> afterCheck: aNode mappings: dict [

	aNode methodNode compiledMethod isRenderingMethod ifFalse: [ ^ false ].
	^ (aNode parent isCascade not)
		and: [ (WASlime isBrushSelector: aNode receiver selector)
		and: [ (WASlime isBrushSelector: aNode receiver selector , ':')
		and: [ (WASlime isBrushSelector: aNode methodNode selector) not ] ] ]
]

{ #category : 'accessing' }
WAUnnecessaryWithSentToBrushRule >> group [

	^ 'Seaside'
]

{ #category : 'initialization' }
WAUnnecessaryWithSentToBrushRule >> initialize [

	super initialize.
	self
		matches: '`html `msg with: ``@arg'
]

{ #category : 'accessing' }
WAUnnecessaryWithSentToBrushRule >> name [

	^ 'Unnecessary #with: sent to brush'
]

{ #category : 'accessing' }
WAUnnecessaryWithSentToBrushRule >> rationale [

	^ 'Sending #with: is only required if attributes are specified too.'
]
