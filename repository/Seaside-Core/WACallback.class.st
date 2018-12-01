Class {
	#name : #WACallback,
	#superclass : #WAObject,
	#instVars : [
		'key'
	],
	#category : 'Seaside-Core-Callbacks'
}

{ #category : #'instance creation' }
WACallback class >> on: aBlock [
	^ self new block: aBlock
]

{ #category : #comparing }
WACallback >> <= other [
	^ self priority < other priority or: [ self priority = other priority and: [ self key asNumber <= other key asNumber ] ]
]

{ #category : #accessing }
WACallback >> block: aBlock [
]

{ #category : #converting }
WACallback >> convertKey: aString [
	^ aString
]

{ #category : #evaluation }
WACallback >> evaluateWithArgument: anObject [
	self subclassResponsibility
]

{ #category : #evaluation }
WACallback >> evaluateWithFieldValues: anOrderedCollection [
	self evaluateWithArgument: (self valueForField: (anOrderedCollection at: 1 ifAbsent: [ nil ]))
]

{ #category : #testing }
WACallback >> isEnabledFor: aRequestContext [
	^ true
]

{ #category : #accessing }
WACallback >> key [
	"Answer the callback key of the receiver."
	
	^ self convertKey: key
]

{ #category : #accessing }
WACallback >> priority [
	"Answer the priority in which the receiver is evaluated."
	
	^ 0
]

{ #category : #initialization }
WACallback >> setKey: aString callbacks: aDictionary [
	key := aString
]

{ #category : #converting }
WACallback >> valueForField: anObject [
	"Answer the value that should be used when the field value in the Request
	is anObject. This allows subclasses to specify a default value other than
	nil, for example."

	^ anObject
]
