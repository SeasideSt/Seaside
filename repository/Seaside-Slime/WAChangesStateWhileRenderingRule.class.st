Class {
	#name : #WAChangesStateWhileRenderingRule,
	#superclass : #GRSlimeBlockLintRule,
	#instVars : [
		'matcher',
		'resultMatcher'
	],
	#category : 'Seaside-Slime'
}

{ #category : #running }
WAChangesStateWhileRenderingRule >> checkMethod: aContext [ 
	| matches vars |
	aContext isRenderingMethod 
		ifFalse: [ ^ self ].
	matches := matcher 
		executeTree: aContext parseTree
		initialAnswer: OrderedCollection new.
	matches isEmpty
		ifTrue: [ ^ self ].
	vars := aContext instVarNames.
	matches do: [ :each | 
		(vars includes: each name) ifTrue: [ 
			result 
				addClass: aContext selectedClass
				selector: aContext selector.
			resultMatcher 
				matchesTree: each parent
				do: [ :node :answer | 
					answer isNil 
						ifTrue: [ node ]
						ifFalse: [ answer ] ] ] ]
]

{ #category : #accessing }
WAChangesStateWhileRenderingRule >> group [
	^ 'Seaside'
]

{ #category : #initialization }
WAChangesStateWhileRenderingRule >> initialize [
	super initialize.
	matcher := RBParseTreeSearcher new.
	matcher 
		matches: '`var'
		do: [ :node :answer | 
			(node isWrite and: [ (WASlime isWithinCallback: node) not ])
				ifTrue: [ answer add: node ].
			answer ]
]

{ #category : #accessing }
WAChangesStateWhileRenderingRule >> name [
	^ 'Changes state while rendering'
]

{ #category : #accessing }
WAChangesStateWhileRenderingRule >> rationale [
	^ 'Application state should not be changed in the rendering code, use a callback to define state.'
]

{ #category : #running }
WAChangesStateWhileRenderingRule >> resetResult [
	super resetResult.
	resultMatcher := RBParseTreeSearcher new.
	self result matcher: resultMatcher
]

{ #category : #accessing }
WAChangesStateWhileRenderingRule >> resultClass [
	^ RBParseTreeEnvironment
]
