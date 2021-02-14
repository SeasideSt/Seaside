Class {
	#name : #WACompositeMimeTypeMatch,
	#superclass : #WAMatch,
	#instVars : [
		'matches'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WACompositeMimeTypeMatch class >> matches: aCollection [
	^ self basicNew initializeWithMatches: aCollection
]

{ #category : #initialization }
WACompositeMimeTypeMatch >> initializeWithMatches: aCollection [
	self initialize.
	matches := aCollection
]

{ #category : #testing }
WACompositeMimeTypeMatch >> matches: aMimeType [
	^ matches anySatisfy: [ :each | each matches: aMimeType ]
]

{ #category : #accessing }
WACompositeMimeTypeMatch >> priorityFor: aMimeType [
	| matched |
	matched := matches select: [ :each | each matches: aMimeType ].
	matched isEmpty
		ifTrue: [ ^ -1 ].
	matched sort: [ :a :b |
		a priority <= b priority ].
	^ matched last priority
]

{ #category : #accessing }
WACompositeMimeTypeMatch >> seasideMimeType [
	"We don't know which one to take."
	^ nil
]
