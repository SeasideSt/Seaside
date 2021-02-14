Class {
	#name : #WAAddRemoveExpression,
	#superclass : #WAAttributeExpression,
	#instVars : [
		'additions',
		'removals'
	],
	#category : 'Seaside-Core-Configuration'
}

{ #category : #accessing }
WAAddRemoveExpression >> additions [
	^ additions
]

{ #category : #accessing }
WAAddRemoveExpression >> additions: aCollection [
	additions := aCollection
]

{ #category : #values }
WAAddRemoveExpression >> determineValueWithContext: aContext configuration: aConfiguration [
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
]

{ #category : #accessing }
WAAddRemoveExpression >> removals [
	^ removals
]

{ #category : #accessing }
WAAddRemoveExpression >> removals: anObject [
	removals := anObject
]
