Class {
	#name : #WAMimeTypeMatchTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #tests }
WAMimeTypeMatchTest >> testFromMimeType [
	| mimeType |
	mimeType := WAMimeTypeMatch fromString: 'application/xml'.
	self assert: mimeType class = WAFullMimeTypeMatch.
	
	mimeType := WAMimeTypeMatch fromString: 'application/*'.
	self assert: mimeType class = WAMainMimeTypeMatch.
	
	mimeType := WAMimeTypeMatch fromString: '*/xml'.
	self assert: mimeType class = WASubMimeTypeMatch.
	
	mimeType := WAMimeTypeMatch fromString: '*/*'.
	self assert: mimeType class = WAWildcardMimeTypeMatch
]
