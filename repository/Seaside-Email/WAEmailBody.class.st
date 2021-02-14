"
I am the abstract superclass for email bodies.
"
Class {
	#name : #WAEmailBody,
	#superclass : #WAObject,
	#instVars : [
		'contentString'
	],
	#category : 'Seaside-Email-Base'
}

{ #category : #accessing }
WAEmailBody >> <= anEmailBody [
	^ self sortOrder <= anEmailBody sortOrder
]

{ #category : #comparing }
WAEmailBody >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ self contentType = anObject contentType
]

{ #category : #accessing }
WAEmailBody >> contentString [
	^ contentString
]

{ #category : #accessing }
WAEmailBody >> contentString: aString [
	contentString := aString
]

{ #category : #accessing }
WAEmailBody >> contentType [
	^ self subclassResponsibility
]

{ #category : #accessing }
WAEmailBody >> greaseString [
	^ self contentString
]

{ #category : #comparing }
WAEmailBody >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ self contentType hash

]

{ #category : #testing }
WAEmailBody >> isHtml [
	^ false
]

{ #category : #testing }
WAEmailBody >> isPlainText [
	^ false
]

{ #category : #accessing }
WAEmailBody >> sortOrder [
	^ self subclassResponsibility
]

{ #category : #accessing }
WAEmailBody >> writeOn: aStream [
	aStream
		nextPutAll: 'Content-Type: ';
		nextPutAll: self contentType greaseString ;
		nextPut: Character cr;
		nextPut: Character cr;
		nextPutAll: self contentString;
		nextPut: Character cr
]
