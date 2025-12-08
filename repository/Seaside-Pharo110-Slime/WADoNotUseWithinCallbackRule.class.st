Class {
	#name : 'WADoNotUseWithinCallbackRule',
	#superclass : 'GRReSlimeParseTreeLintRule',
	#category : 'Seaside-Pharo110-Slime',
	#package : 'Seaside-Pharo110-Slime'
}

{ #category : 'hooks' }
WADoNotUseWithinCallbackRule >> afterCheck: aNode mappings: dict [

	aNode methodNode compiledMethod isRenderingMethod ifFalse: [ ^ false ].
	(WASlime isWithinCallback: aNode) ifFalse: [ ^ false ].
	^ true
]

{ #category : 'accessing' }
WADoNotUseWithinCallbackRule >> group [

	^ 'Seaside'
]

{ #category : 'initialization' }
WADoNotUseWithinCallbackRule >> initialize [
	super initialize.
	self matchesAny: (self selectors
			collect: [ :each | '``@receiver' , (self genericPatternForSelector: each) ])
]

{ #category : 'accessing' }
WADoNotUseWithinCallbackRule >> name [
	^ 'Do not use within callback'
]

{ #category : 'accessing' }
WADoNotUseWithinCallbackRule >> rationale [

	^ 'Certain functionaly should not be used within callbacks. For example: #addLoadScript: should only be used while rendering.'
]

{ #category : 'private' }
WADoNotUseWithinCallbackRule >> selectors [
	^ #( addLoadScript: )
]
