"
I encode XHTML text.
"
Class {
	#name : #WAXmlEncoder,
	#superclass : #WAEncoder,
	#category : 'Seaside-Core-Document'
}

{ #category : #'instance creation' }
WAXmlEncoder class >> on: aStream codec: aCodec [
	"For compatibility with WAUrlEncoder"
	^ self on: aStream
]

{ #category : #accessing }
WAXmlEncoder >> nextPut: aCharacter [
	| codePoint |
	codePoint := aCharacter greaseInteger.
	codePoint = 34 "$""" ifTrue: [ ^ stream nextPutAll: '&quot;' ].
	codePoint = 60 "$<" ifTrue: [ ^ stream nextPutAll: '&lt;' ].
	codePoint = 38 "$&" ifTrue: [ ^ stream nextPutAll: '&amp;' ].
	codePoint = 62 "$>" ifTrue: [ ^ stream nextPutAll: '&gt;' ].
	stream nextPut: aCharacter
]

{ #category : #accessing }
WAXmlEncoder >> nextPutAll: aString [
	"uses #to:do: for speed reasons (on Pharo)
	this is not premature optimization, this is a hotspot method method
	and #to:do: shows measurable speed improvements for rendering seaside pages"
	1 to: aString size do: [ :index |
		self nextPut: (aString at: index) ]
]
