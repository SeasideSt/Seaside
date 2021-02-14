Class {
	#name : #WASequencedAsynchronousCallsRule,
	#superclass : #GRSlimeParseTreeLintRule,
	#category : 'Seaside-Pharo-Slime'
}

{ #category : #accessing }
WASequencedAsynchronousCallsRule >> ajaxSelectors [
	^ #(	"Prototype:"	evaluator insertion periodical periodicalEvaluator request updater
			"JQuery:"		ajax get getJson getScript post )
]

{ #category : #running }
WASequencedAsynchronousCallsRule >> checkMethod: aContext [
	aContext isRenderingMethod 
		ifTrue: [ super checkMethod: aContext ]
]

{ #category : #accessing }
WASequencedAsynchronousCallsRule >> group [
	^ 'Seaside'
]

{ #category : #initialization }
WASequencedAsynchronousCallsRule >> initialize [
	super initialize.
	self ajaxSelectors do: [ :selector |
		self matcher
			matches: '`@receiver ' , selector , ' `@method: `@arguments' 
			do: [ :node :answer |
				answer isNil
					ifFalse: [ answer ]
					ifTrue: [ 
						| owner |
						owner := node isCascaded
							ifTrue: [ node parent parent ]
							ifFalse: [ node parent ].
						(owner notNil and: [ owner isMessage and: [ owner selector = #, ] ])
							ifTrue: [ owner ] ] ] ]
]

{ #category : #accessing }
WASequencedAsynchronousCallsRule >> name [
	^ 'Sequenced asynchronous calls'
]

{ #category : #accessing }
WASequencedAsynchronousCallsRule >> rationale [
	^ 'AJAX calls are asynchronous by default and they immediately return. Therefor it is a bug in most cases if an AJAX call is followed by other actions. If there are multiple AJAX calls try to combine them into one that is also more, or alternatively start the next request once the first one has completed.'
]
