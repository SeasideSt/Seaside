Class {
	#name : #WAExtractCallbackCodeToMethodRule,
	#superclass : #GRSlimeParseTreeLintRule,
	#category : 'Seaside-Pharo-Slime'
}

{ #category : #accessing }
WAExtractCallbackCodeToMethodRule >> group [
	^ 'Seaside'
]

{ #category : #initialization }
WAExtractCallbackCodeToMethodRule >> initialize [
	super initialize.
	self matcher
		matchesAnyOf: (WASlime callbackSelectors
			collect: [ :each | '`html `msg' , (self genericPatternForSelector: each) ])
		do: [ :node :answer |
			(answer isNil and: [ WASlime isBrushSelector: node receiver selector ]) 
				ifTrue: [
					node arguments
						detect: [ :each | each isBlock and: [ each body statements size > 1 ] ]
						ifNone: [ answer ] ]
				ifFalse: [ answer ] ]
]

{ #category : #accessing }
WAExtractCallbackCodeToMethodRule >> name [
	^ 'Extract callback code to separate method'
]

{ #category : #accessing }
WAExtractCallbackCodeToMethodRule >> rationale [
	^ 'For clarity rendering code and callback code should not be mixed, extract the contents of the callback block to a separate method.'
]
