Class {
	#name : #WAUnnecessaryBlockPassedToBrushRule,
	#superclass : #GRSlimeParseTreeLintRule,
	#category : 'Seaside-Pharo-Slime'
}

{ #category : #running }
WAUnnecessaryBlockPassedToBrushRule >> checkMethod: aContext [
	aContext isRenderingMethod 
		ifTrue: [ super checkMethod: aContext ]
]

{ #category : #accessing }
WAUnnecessaryBlockPassedToBrushRule >> group [
	^ 'Seaside'
]

{ #category : #initialization }
WAUnnecessaryBlockPassedToBrushRule >> initialize [
	super initialize.
	self matcher 
		matchesAnyOf: #(
			'`html `msg: [ ]'
			'`html `msg: [ `html text: ``@arg ]'
			'`html `msg: [ `html render: ``@arg ]' )
		do: [ :node :answer | 
			(answer isNil and: [ WASlime isBrushSelector: node selector ])
				ifTrue: [ node arguments first ]
				ifFalse: [ answer ] ].
	self matcher 
		matchesAnyOf: #(
			'`html `msg with: [ ]'
			'`html `msg with: [ `html text: ``@arg ]'
			'`html `msg with: [ `html render: ``@arg ]' )
		do: [ :node :answer | 
			(answer isNil and: [ WASlime isBrushSelector: node receiver selector ])
				ifTrue: [ node arguments first ]
				ifFalse: [ answer ] ]
]

{ #category : #accessing }
WAUnnecessaryBlockPassedToBrushRule >> name [
	^ 'Unnecessary block passed to brush'
]

{ #category : #accessing }
WAUnnecessaryBlockPassedToBrushRule >> rationale [
	^ 'Sending a block as argument to #with: is only needed when nesting brushes.'
]
