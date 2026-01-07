Class {
	#name : 'WAExtractCallbackCodeToMethodRule',
	#superclass : 'GRReSlimeParseTreeLintRule',
	#category : 'Seaside-Pharo110-Slime',
	#package : 'Seaside-Pharo110-Slime'
}

{ #category : 'hooks' }
WAExtractCallbackCodeToMethodRule >> afterCheck: aNode mappings: dict [

	^ (WASlime isBrushSelector: aNode receiver selector) and: [
		  aNode arguments anySatisfy: [ :each |
			  each isBlock and: [ each body statements size > 1 ] ] ]
]

{ #category : 'accessing' }
WAExtractCallbackCodeToMethodRule >> group [

	^ 'Seaside'
]

{ #category : 'initialization' }
WAExtractCallbackCodeToMethodRule >> initialize [

	super initialize.
	self matchesAny: (WASlime callbackSelectors collect: [ :each |
		'`html `msg' , (self genericPatternForSelector: each) ])
]

{ #category : 'accessing' }
WAExtractCallbackCodeToMethodRule >> name [

	^ 'Extract callback code to separate method'
]

{ #category : 'accessing' }
WAExtractCallbackCodeToMethodRule >> rationale [

	^ 'For clarity rendering code and callback code should not be mixed, extract the contents of the callback block to a separate method.'
]
