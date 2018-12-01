Class {
	#name : #WAFileLibraryResource,
	#superclass : #WAObject,
	#instVars : [
		'filepath',
		'mimeType',
		'cacheDuration',
		'contents'
	],
	#category : 'Seaside-Core-Libraries'
}

{ #category : #'instance creation' }
WAFileLibraryResource class >> emptyInstance [
	^ self filepath: '' mimeType: WAMimeType textPlain cacheDuration: Duration zero contents: ''
]

{ #category : #'instance creation' }
WAFileLibraryResource class >> filepath: filepath mimeType: aMimeType cacheDuration: cacheDuration contents: contents [
	^ self new
		filepath: filepath;
		mimeType: aMimeType;
		cacheDuration: cacheDuration;
		contents: contents;
		yourself
]

{ #category : #accessing }
WAFileLibraryResource >> cacheDuration [
	^ cacheDuration
]

{ #category : #accessing }
WAFileLibraryResource >> cacheDuration: anObject [
	cacheDuration := anObject
]

{ #category : #accessing }
WAFileLibraryResource >> contents [
	^ contents
]

{ #category : #accessing }
WAFileLibraryResource >> contents: anObject [
	contents := anObject
]

{ #category : #accessing }
WAFileLibraryResource >> filepath [
	^ filepath
]

{ #category : #accessing }
WAFileLibraryResource >> filepath: anObject [
	filepath := anObject
]

{ #category : #accessing }
WAFileLibraryResource >> mimeType [
	^ mimeType
]

{ #category : #accessing }
WAFileLibraryResource >> mimeType: anObject [
	mimeType := anObject
]

{ #category : #printing }
WAFileLibraryResource >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' cacheDuration: ';
		print: self cacheDuration.
	aStream
		nextPutAll: ' filepath: ';
		print: self filepath.
	aStream
		nextPutAll: ' mimeType: ';
		print: self mimeType.
	aStream
		nextPutAll: ' contents: ';
		print: (self contents greaseString truncateWithElipsisTo: 100)
]
