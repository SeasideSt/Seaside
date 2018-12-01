Class {
	#name : #WADoNotUseWhileRenderingRule,
	#superclass : #GRSlimeBlockLintRule,
	#instVars : [
		'matcher'
	],
	#category : 'Seaside-Slime'
}

{ #category : #running }
WADoNotUseWhileRenderingRule >> checkMethod: aContext [ 
	| matches |
	aContext isRenderingMethod 	
		ifFalse: [ ^ self ].
	matches := matcher 
		executeTree: aContext parseTree
		initialAnswer: OrderedCollection new.
	matches do: [ :each | 
		result 
			addClass: aContext selectedClass
			selector: aContext selector.
		result addSearchString: each selector ]
]

{ #category : #accessing }
WADoNotUseWhileRenderingRule >> group [
	^ 'Seaside'
]

{ #category : #initialization }
WADoNotUseWhileRenderingRule >> initialize [
	super initialize.
	matcher := RBParseTreeSearcher new.
	matcher 
		matchesAnyOf: (self selectors
			collect: [ :each | 'self' , (self genericPatternForSelector: each) ])
		do: [ :node :answer |
			(WASlime isWithinCallback: node)
				ifFalse: [ answer add: node ].
			answer ]
]

{ #category : #accessing }
WADoNotUseWhileRenderingRule >> name [
	^ 'Do not use while rendering'
]

{ #category : #accessing }
WADoNotUseWhileRenderingRule >> rationale [
	^ 'Certain functionaly should not be used while rendering. For example: #call: and #answer: should only be used from within callback code.'
]

{ #category : #private }
WADoNotUseWhileRenderingRule >> selectors [
	^ #( answer answer: call: show: show:onAnswer: show:onAnswer:delegation: lightbox: chooseFrom: chooseFrom:caption: confirm: inform: request: request:default: request:label: request:label:default: wait: addDecoration: addMessage: answer answer: authenticateWith:during: call: chooseFrom: chooseFrom:caption: chooseFrom:caption:onAnswer: chooseFrom:onAnswer: confirm: confirm:onAnswer: decorateWith:during: filterWith:during: home inform: inform:onAnswer: isolate: lightbox: removeDecoration: removeDelegation request: request:default: request:default:onAnswer: request:label: request:label:default: request:label:default:onAnswer: request:label:onAnswer: request:onAnswer: show: show:onAnswer: show:onAnswer:delegation: validateWith: wait: )
]
