Class {
	#name : #WAHttpVersion,
	#superclass : #WAObject,
	#instVars : [
		'major',
		'minor'
	],
	#category : 'Seaside-Core-HTTP'
}

{ #category : #'instance creation' }
WAHttpVersion class >> fromString: aString [
	^ self readFrom: aString readStream
]

{ #category : #'instance creation' }
WAHttpVersion class >> http10 [
	^ self major: 1 minor: 0
]

{ #category : #'instance creation' }
WAHttpVersion class >> http11 [
	^ self major: 1 minor: 1
]

{ #category : #'instance creation' }
WAHttpVersion class >> major: majorInteger minor: minorInteger [
	^ self basicNew
		initializeWithMajor: majorInteger minor: minorInteger;
		yourself
]

{ #category : #'instance creation' }
WAHttpVersion class >> new [
	^ self http11
]

{ #category : #'instance creation' }
WAHttpVersion class >> readFrom: aStream [ 
	| major minor |
	[ aStream peek = Character space ] whileTrue: [ aStream next ].
	aStream peek = $H ifTrue: [ aStream skipTo: $/ ].	"Skip over 'HTTP/' "
	major := aStream upTo: $..
	minor := aStream upTo: Character space.
	^ self 
		major: major greaseInteger
		minor: minor greaseInteger
]

{ #category : #comparing }
WAHttpVersion >> < otherVersion [
	^ (major < otherVersion major) or: [
		(major = otherVersion major) and: [ minor < otherVersion minor ] ]
]

{ #category : #comparing }
WAHttpVersion >> <= otherVersion [
	^ (self = otherVersion) or: [ self < otherVersion ]
]

{ #category : #comparing }
WAHttpVersion >> = otherVersion [
	^ (major = otherVersion major) and: [ minor = otherVersion minor ]
]

{ #category : #comparing }
WAHttpVersion >> > otherVersion [
	^ (major > otherVersion major) or: [
		(major = otherVersion major) and: [ minor > otherVersion minor ] ]
]

{ #category : #comparing }
WAHttpVersion >> >= otherVersion [
	^ (self = otherVersion) or: [ self > otherVersion ]
]

{ #category : #comparing }
WAHttpVersion >> hash [
	^ major hash bitXor: minor hash
]

{ #category : #initialization }
WAHttpVersion >> initializeWithMajor: majorInteger minor: minorInteger [
	self initialize.
	major := majorInteger.
	minor := minorInteger
]

{ #category : #testing }
WAHttpVersion >> isHttp10 [
	^ major = 1 and: [ minor = 0 ]
]

{ #category : #testing }
WAHttpVersion >> isHttp11 [
	^ major = 1 and: [ minor = 1 ]
]

{ #category : #accessing }
WAHttpVersion >> major [
	^ major
]

{ #category : #accessing }
WAHttpVersion >> minor [
	^ minor
]

{ #category : #printing }
WAHttpVersion >> printOn: aStream [
	aStream nextPutAll: 'HTTP/'.
	major printOn: aStream.
	aStream nextPut: $..
	minor printOn: aStream
]
