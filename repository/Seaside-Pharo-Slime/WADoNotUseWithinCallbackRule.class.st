Class {
	#name : #WADoNotUseWithinCallbackRule,
	#superclass : #GRSlimeBlockLintRule,
	#instVars : [
		'matcher'
	],
	#category : 'Seaside-Pharo-Slime'
}

{ #category : #running }
WADoNotUseWithinCallbackRule >> checkMethod: aContext [
	| matches |
	aContext isRenderingMethod 	
		ifFalse: [ ^ self ].
	matches := matcher 
		executeTree: aContext parseTree
		initialAnswer: OrderedCollection new.
	matches do: [ :each | 
		result 
			addClass: aContext methodClass
			selector: aContext selector.
		result addSearchString: each selector ]
]

{ #category : #accessing }
WADoNotUseWithinCallbackRule >> group [
	^ 'Seaside'
]

{ #category : #initialization }
WADoNotUseWithinCallbackRule >> initialize [
	super initialize.
	matcher := RBParseTreeSearcher new.
	matcher 
		matchesAnyOf: (self selectors
			collect: [ :each | '``@receiver' , (self genericPatternForSelector: each) ])
		do: [ :node :answer | 
			(WASlime isWithinCallback: node)
				ifTrue: [ answer add: node ].
			answer ]
]

{ #category : #accessing }
WADoNotUseWithinCallbackRule >> name [
	^ 'Do not use within callback'
]

{ #category : #accessing }
WADoNotUseWithinCallbackRule >> rationale [
	^ 'Certain functionaly should not be used within callbacks. For example: #addLoadScript: should only be used while rendering.'
]

{ #category : #private }
WADoNotUseWithinCallbackRule >> selectors [
	^ #( addLoadScript: )
]
