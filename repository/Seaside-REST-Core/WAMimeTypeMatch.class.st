Class {
	#name : #WAMimeTypeMatch,
	#superclass : #WAMatch,
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WAMimeTypeMatch class >> fromMimeType: aMimeType [
	^ aMimeType main = '*'
		ifTrue: [
			aMimeType sub = '*'
				ifTrue: [ WAWildcardMimeTypeMatch new ]
				ifFalse: [ WASubMimeTypeMatch
					sub: aMimeType sub ] ]
		ifFalse: [
			aMimeType sub = '*'
				ifTrue: [ WAMainMimeTypeMatch
					main: aMimeType main ]
				ifFalse: [ WAFullMimeTypeMatch
					main: aMimeType main
					sub: aMimeType sub ] ]
]

{ #category : #'instance creation' }
WAMimeTypeMatch class >> fromString: aString [
	^ self fromMimeType: (WAMimeType fromString: aString)
]

{ #category : #testing }
WAMimeTypeMatch >> matches: aMimeType [
	self subclassResponsibility
]

{ #category : #accessing }
WAMimeTypeMatch >> priority [
	self subclassResponsibility
]

{ #category : #accessing }
WAMimeTypeMatch >> priorityFor: aMimeType [
	self subclassResponsibility
]

{ #category : #accessing }
WAMimeTypeMatch >> seasideMimeType [
	"Works only for exact matches."
	^ nil
]
