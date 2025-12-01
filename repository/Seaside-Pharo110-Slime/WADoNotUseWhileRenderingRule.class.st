Class {
	#name : 'WADoNotUseWhileRenderingRule',
	#superclass : 'GRReSlimeParseTreeLintRule',
	#category : 'Seaside-Pharo110-Slime',
	#package : 'Seaside-Pharo110-Slime'
}

{ #category : 'hooks' }
WADoNotUseWhileRenderingRule >> afterCheck: aNode mappings: dict [

	aNode methodNode compiledMethod isRenderingMethod ifFalse: [ ^ false ].
	(WASlime isWithinCallback: aNode) ifTrue: [ ^ false ].
	^ true
]

{ #category : 'accessing' }
WADoNotUseWhileRenderingRule >> group [

	^ 'Seaside'
]

{ #category : 'initialization' }
WADoNotUseWhileRenderingRule >> initialize [

	super initialize.
	self matchesAny: (self selectors
			collect: [ :each | 'self' , (self genericPatternForSelector: each) ])
]

{ #category : 'accessing' }
WADoNotUseWhileRenderingRule >> name [

	^ 'Do not use while rendering'
]

{ #category : 'accessing' }
WADoNotUseWhileRenderingRule >> rationale [

	^ 'Certain functionaly should not be used while rendering. For example: #call: and #answer: should only be used from within callback code.'
]

{ #category : 'private' }
WADoNotUseWhileRenderingRule >> selectors [

	^ #( answer answer: call: show: show:onAnswer: show:onAnswer:delegation: lightbox: chooseFrom: chooseFrom:caption: confirm: inform: request: request:default: request:label: request:label:default: wait: addDecoration: addMessage: answer answer: authenticateWith:during: call: chooseFrom: chooseFrom:caption: chooseFrom:caption:onAnswer: chooseFrom:onAnswer: confirm: confirm:onAnswer: decorateWith:during: filterWith:during: home inform: inform:onAnswer: isolate: lightbox: removeDecoration: removeDelegation request: request:default: request:default:onAnswer: request:label: request:label:default: request:label:default:onAnswer: request:label:onAnswer: request:onAnswer: show: show:onAnswer: show:onAnswer:delegation: validateWith: wait: )
]
