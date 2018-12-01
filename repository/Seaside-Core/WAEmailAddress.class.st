Class {
	#name : #WAEmailAddress,
	#superclass : #WAObject,
	#instVars : [
		'username',
		'address'
	],
	#category : 'Seaside-Core-HTTP'
}

{ #category : #'instance creation' }
WAEmailAddress class >> address: aString [
	^ self new
		address: aString;
		yourself
]

{ #category : #'instance creation' }
WAEmailAddress class >> address: anAddressString username: aUsernameString [
	^ self new
		address: anAddressString;
		username: aUsernameString;
		yourself
]

{ #category : #accessing }
WAEmailAddress >> address [
	^ address
]

{ #category : #accessing }
WAEmailAddress >> address: aString [
	address := self sanitize: aString
]

{ #category : #displaying }
WAEmailAddress >> encodeOn: aDocument [
	self encodeOn: aDocument xmlEncoder usingQuotes: false
]

{ #category : #private }
WAEmailAddress >> encodeOn: aStream usingQuotes: aBoolean [
	username isNil ifFalse:  [
		aBoolean ifTrue: [ aStream nextPut: $" ].
		aStream nextPutAll: username.
		aBoolean ifTrue: [ aStream nextPut: $" ].
		aStream nextPutAll: ' <' ].
	aStream nextPutAll: address.
	username isNil ifFalse: [ aStream nextPut: $> ]
]

{ #category : #displaying }
WAEmailAddress >> greaseString [
	^ String streamContents: [ :stream | 
		self 
			encodeOn: stream
			usingQuotes: true ]
]

{ #category : #printing }
WAEmailAddress >> printOn: aStream [ 
	super printOn: aStream.
	aStream nextPut: $(.
	aStream nextPutAll: self greaseString.
	aStream nextPut: $)
]

{ #category : #private }
WAEmailAddress >> sanitize: aString [
	"prevents SMTP header injection"
	| newlineIndex |
	newlineIndex := (aString indexOf: Character cr) min: (aString indexOf: Character lf).
	^ newlineIndex = 0
		ifTrue: [ aString ]
		ifFalse: [ aString copyFrom: 1 to: newlineIndex - 1  ]
]

{ #category : #accessing }
WAEmailAddress >> username [
	^ username
]

{ #category : #accessing }
WAEmailAddress >> username: aString [
	username := self sanitize: aString
]
