values-private
valueForContext: aContext
	aContext at: self ifPresent: [ :v | ^ v ].
	
	self expressionAt: aContext key ifPresent: [ :expression |
		^ aContext
			at: self
			put: (expression determineValueWithContext: aContext configuration: self) ].
	
	(aContext isAttributeLocalOn: self) ifTrue: [ ^ aContext at: self put: nil ].

	^ aContext at: self put: (self inheritedValueForContext: aContext)