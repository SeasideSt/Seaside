Class {
	#name : 'WAChangesStateWhileRenderingRule',
	#superclass : 'GRReSlimeParseTreeLintRule',
	#category : 'Seaside-Pharo110-Slime',
	#package : 'Seaside-Pharo110-Slime'
}

{ #category : 'hooks' }
WAChangesStateWhileRenderingRule >> afterCheck: aNode mappings: dict [

	aNode methodNode compiledMethod isRenderingMethod ifFalse: [ ^ false ].
	aNode isWrite ifFalse: [ ^ false ].
	(WASlime isWithinCallback: aNode) ifTrue:[ ^ false ].

	^ true
]

{ #category : 'accessing' }
WAChangesStateWhileRenderingRule >> group [

	^ 'Seaside'
]

{ #category : 'initialization' }
WAChangesStateWhileRenderingRule >> initialize [

	super initialize.
	self matches: '`var'
]

{ #category : 'accessing' }
WAChangesStateWhileRenderingRule >> name [

	^ 'Changes state while rendering'
]

{ #category : 'accessing' }
WAChangesStateWhileRenderingRule >> rationale [

	^ 'Application state should not be changed in the rendering code, use a callback to define state.'
]
