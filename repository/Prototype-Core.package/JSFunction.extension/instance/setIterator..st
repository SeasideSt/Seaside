*prototype-core
setIterator: aBlock 
	| factory |
	factory := (PTFactory 
		context: self renderContext
		using: [ :each | 
			(each respondsTo: #id:)
				ifTrue: [ each id: (JSStream argument: 0) ].
			self add: each ]).
	factory rendererClass: self rendererClass.
	aBlock value: factory