Class {
	#name : 'WASequencedAsynchronousCallsRule',
	#superclass : 'GRReSlimeParseTreeLintRule',
	#category : 'Seaside-Pharo110-Slime',
	#package : 'Seaside-Pharo110-Slime'
}

{ #category : 'hooks' }
WASequencedAsynchronousCallsRule >> afterCheck: aNode mappings: dict [

	| owner |
	aNode methodNode compiledMethod isRenderingMethod ifFalse:[ ^ false ].
	owner := aNode isCascaded
		ifTrue: [ aNode parent parent ]
		ifFalse: [ aNode parent ].
	^ (owner notNil and: [ owner isMessage and: [ owner selector = #, ] ])
]

{ #category : 'accessing' }
WASequencedAsynchronousCallsRule >> ajaxSelectors [

	^ #(	"Prototype:"	evaluator insertion periodical periodicalEvaluator request updater
			"JQuery:"		ajax get getJson getScript post )
]

{ #category : 'accessing' }
WASequencedAsynchronousCallsRule >> group [

	^ 'Seaside'
]

{ #category : 'initialization' }
WASequencedAsynchronousCallsRule >> initialize [

	super initialize.
	self ajaxSelectors do: [ :selector |
		self matches: '`@receiver ' , selector , ' `@method: `@arguments' ]
]

{ #category : 'accessing' }
WASequencedAsynchronousCallsRule >> name [

	^ 'Sequenced asynchronous calls'
]

{ #category : 'accessing' }
WASequencedAsynchronousCallsRule >> rationale [

	^ 'AJAX calls are asynchronous by default and they immediately return. Therefor it is a bug in most cases if an AJAX call is followed by other actions. If there are multiple AJAX calls try to combine them into one that is also more, or alternatively start the next request once the first one has completed.'
]
