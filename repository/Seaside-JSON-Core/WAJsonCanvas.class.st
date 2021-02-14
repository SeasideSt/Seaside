"
I am a  specific canvas to render JSON output.
"
Class {
	#name : #WAJsonCanvas,
	#superclass : #WACanvas,
	#instVars : [
		'first'
	],
	#category : 'Seaside-JSON-Core'
}

{ #category : #'instance creation' }
WAJsonCanvas class >> builder [
	^ (WABuilder on: self)
		documentClass: WAJsonDocument;
		yourself
]

{ #category : #public }
WAJsonCanvas >> array: aBlock [
	^ (self brush: WAJsonArrayBrush new) with: aBlock
]

{ #category : #'double-disptach' }
WAJsonCanvas >> boolean: aBoolean [
	self document stream nextPutAll: (aBoolean ifTrue: [ 'true' ] ifFalse: [ 'false' ])
]

{ #category : #'double-disptach' }
WAJsonCanvas >> dateAndTime: aDateAndTime [
	" Note: date and time is not standard json. So we use the ISO 8601 standard here. We convert to string to make it valid json "
	self document stream nextPut: $".
	aDateAndTime printOn: self document stream.
	self document stream nextPut: $"

]

{ #category : #initialization }
WAJsonCanvas >> initializeWithContext: aRenderContext [
	super initializeWithContext: aRenderContext.
	first := true
]

{ #category : #public }
WAJsonCanvas >> key: aKeyString value: aValueObject [
	^ (self brush: (WAJsonKeyValueBrush key: aKeyString)) with: aValueObject
]

{ #category : #private }
WAJsonCanvas >> nest: aBlock [
	first := true.
	super nest: aBlock.
	first := false
]

{ #category : #public }
WAJsonCanvas >> nextPut: aCharacter [ 
	self document nextPut: aCharacter
]

{ #category : #'double-disptach' }
WAJsonCanvas >> null [
	self document stream nextPutAll: 'null'
]

{ #category : #'double-disptach' }
WAJsonCanvas >> number: aNumber [
	aNumber printOn: self document stream
]

{ #category : #public }
WAJsonCanvas >> object: aBlock [
	^ (self brush: WAJsonObjectBrush new) with: aBlock
]

{ #category : #public }
WAJsonCanvas >> render: anObject [
	self flush.
	anObject jsonOn: self
]

{ #category : #'double-disptach' }
WAJsonCanvas >> scaledDecimal: aScaledDecimal [
	| converter |
	converter := GRSignPrinter new, (GRNumberPrinter new precision: aScaledDecimal scale).
	converter print: aScaledDecimal on: self document stream
]

{ #category : #'double-disptach' }
WAJsonCanvas >> string: aString [
	self document string: aString
]

{ #category : #public }
WAJsonCanvas >> value: aBlock [
	^ (self brush: WAJsonValueBrush new) with: aBlock
]

{ #category : #private }
WAJsonCanvas >> writeIfNotFirst: aString [
	first ifFalse: [
		self document nextPutAll: aString ]
]
