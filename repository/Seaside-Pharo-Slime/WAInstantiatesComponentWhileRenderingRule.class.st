Class {
	#name : #WAInstantiatesComponentWhileRenderingRule,
	#superclass : #GRSlimeBlockLintRule,
	#instVars : [
		'matcher'
	],
	#category : 'Seaside-Pharo-Slime'
}

{ #category : #running }
WAInstantiatesComponentWhileRenderingRule >> checkMethod: aContext [ 
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
		result addSearchString: each receiver name ]
]

{ #category : #accessing }
WAInstantiatesComponentWhileRenderingRule >> group [
	^ 'Seaside'
]

{ #category : #initialization }
WAInstantiatesComponentWhileRenderingRule >> initialize [
	super initialize.
	matcher := RBParseTreeSearcher new.
	matcher 
		matches: '`receiver `@message: ``@args'
		do: [ :node :answer |
			| class |
			((class := Smalltalk classNamed: node receiver name) notNil and: [ class isBehavior and: [ (WASlime class: class includesBehaviorNamed: #WAPresenter) and: [ (WASlime isWithinCallback: node) not ] ] ])
				ifTrue: [ answer add: node ].
			answer ]
]

{ #category : #accessing }
WAInstantiatesComponentWhileRenderingRule >> name [
	^ 'Instantiates component while rendering'
]

{ #category : #accessing }
WAInstantiatesComponentWhileRenderingRule >> rationale [
	^ 'Components should only be instanciated in initialization-code, callbacks or through lazy initialization.'
]
