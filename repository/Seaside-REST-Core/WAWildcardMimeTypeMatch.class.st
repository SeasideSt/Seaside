Class {
	#name : #WAWildcardMimeTypeMatch,
	#superclass : #WAMimeTypeMatch,
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #testing }
WAWildcardMimeTypeMatch >> matches: aMimeType [
	^ true
]

{ #category : #printing }
WAWildcardMimeTypeMatch >> printOn: aStream [
	super printOn: aStream.

	aStream 
		nextPutAll: ' (mimeType: '; print: (WAMimeType main: '*' sub: '*');
		nextPutAll: ' priority: '; print: self priority;
		nextPut: $)
]

{ #category : #accessing }
WAWildcardMimeTypeMatch >> priority [
	^ 1
]

{ #category : #accessing }
WAWildcardMimeTypeMatch >> priorityFor: aMimeType [
	^ self priority
]
