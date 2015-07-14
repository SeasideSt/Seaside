values-private
inheritedValueForContext: aContext
	| value |
	(self parents select: [ :each | aContext isAttributeInheritedOn: each ]) reverseDo: [ :each |
		value := each valueForContext: aContext.
		value notNil ifTrue: [ ^ value ] ].
	
	^ nil