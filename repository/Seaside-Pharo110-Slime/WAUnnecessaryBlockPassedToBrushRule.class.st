Class {
	#name : 'WAUnnecessaryBlockPassedToBrushRule',
	#superclass : 'GRReSlimeParseTreeLintRule',
	#category : 'Seaside-Pharo110-Slime',
	#package : 'Seaside-Pharo110-Slime'
}

{ #category : 'hooks' }
WAUnnecessaryBlockPassedToBrushRule >> afterCheck: aNode mappings: dict [

	aNode methodNode compiledMethod isRenderingMethod ifFalse:[ ^ false ].
	^ (aNode selector = #with:)
		ifTrue: [ WASlime isBrushSelector: aNode receiver selector ] 
		ifFalse: [ WASlime isBrushSelector: aNode selector ]
]

{ #category : 'accessing' }
WAUnnecessaryBlockPassedToBrushRule >> group [

	^ 'Seaside'
]

{ #category : 'initialization' }
WAUnnecessaryBlockPassedToBrushRule >> initialize [

	super initialize.
	self 
		matchesAny: #(
			'`html `msg: [ ]'
			'`html `msg: [ `html text: ``@arg ]'
			'`html `msg: [ `html render: ``@arg ]'
			'`html `msg with: [ ]'
			'`html `msg with: [ `html text: ``@arg ]'
			'`html `msg with: [ `html render: ``@arg ]' )
]

{ #category : 'accessing' }
WAUnnecessaryBlockPassedToBrushRule >> name [

	^ 'Unnecessary block passed to brush'
]

{ #category : 'accessing' }
WAUnnecessaryBlockPassedToBrushRule >> rationale [

	^ 'Sending a block as argument to #with: is only needed when nesting brushes.'
]
