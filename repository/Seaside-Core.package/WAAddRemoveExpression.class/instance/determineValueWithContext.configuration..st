values
determineValueWithContext: aContext configuration: aConfiguration
	| collection result |
	collection := aConfiguration inheritedValueForContext: aContext.
	
	collection isNil ifTrue: [ collection := aContext attribute default ].
	collection isNil ifTrue: [ collection := Array new ].
	
	result := OrderedCollection withAll: collection.
	result := result reject: [ :each |
		(self additions includes: each)
			or: [ self removals includes: each ] ].
	result addAll: self additions.
	
	^ result asArray