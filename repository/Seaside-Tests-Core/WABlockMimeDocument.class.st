"
I am a MIME document whos contents are generated dynamically by a block.

I can be used like this:

html image
	document: (WABlockMimeDocument onBlock: [ self generateSvg ])
	mimeType: (WAMimeType main: 'image' sub: 'svg+xml')

Instance Variables
	block:		<aNiladicBlock>

block
	- the block that generates the contents, either a String or ByteArray
"
Class {
	#name : #WABlockMimeDocument,
	#superclass : #WAMimeDocument,
	#instVars : [
		'block'
	],
	#category : 'Seaside-Tests-Core-HTTP'
}

{ #category : #'instance creation' }
WABlockMimeDocument class >> onBlock: aNiladicBlock [
	^ self basicNew initializeOnBlock: aNiladicBlock
]

{ #category : #accessing }
WABlockMimeDocument >> contents [
	^ block value
]

{ #category : #accessing }
WABlockMimeDocument >> contents: aCollection [
	self shouldNotImplement
]

{ #category : #initialization }
WABlockMimeDocument >> initializeOnBlock: aNiladicBlock [
	self initialize.
	self mimeType: nil.
	self fileName: nil.
	block := aNiladicBlock
]

{ #category : #converting }
WABlockMimeDocument >> seasideMimeDocumentType: aMimeType [
	aMimeType = self mimeType
		ifTrue: [ ^ self ].
	^ self copy
		mimeType: aMimeType;
		yourself
]
