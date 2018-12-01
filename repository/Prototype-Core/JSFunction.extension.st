Extension { #name : #JSFunction }

{ #category : #'*prototype-core-instance-creation' }
JSFunction classSide >> context: aRenderContext iterator: aBlock [
	^ (self context: aRenderContext) setIterator: aBlock
]

{ #category : #'*prototype-core' }
JSFunction >> setIterator: aBlock [ 
	| factory |
	factory := (PTFactory 
		context: self renderContext
		using: [ :each | 
			(each respondsTo: #id:)
				ifTrue: [ each id: (JSStream argument: 0) ].
			self add: each ]).
	factory rendererClass: self rendererClass.
	aBlock value: factory
]
