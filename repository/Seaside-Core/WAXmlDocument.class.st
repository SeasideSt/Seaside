"
A WAXmlDocument is adds the possibility to generate XML tags and knows encoders for XML text and URLs.
"
Class {
	#name : #WAXmlDocument,
	#superclass : #WADocument,
	#instVars : [
		'urlEncoder',
		'xmlEncoder'
	],
	#category : 'Seaside-Core-Document'
}

{ #category : #writing }
WAXmlDocument >> closeTag: aString [
	"Close the XML tag named aString."

	stream nextPutAll: '</'; nextPutAll: aString; nextPut: $>
]

{ #category : #initialization }
WAXmlDocument >> destroy [
	super destroy.
	urlEncoder := xmlEncoder := nil
]

{ #category : #initialization }
WAXmlDocument >> initializeWithStream: aStream codec: aCodec [
	super initializeWithStream: aStream codec: aCodec.
	xmlEncoder := GRPlatform current xmlEncoderOn: aStream.
	urlEncoder := GRPlatform current urlEncoderOn: aStream codec: aCodec
]

{ #category : #writing }
WAXmlDocument >> openTag: aString [
	"Open the XML tag named aString."

	self openTag: aString attributes: nil closed: false
]

{ #category : #writing }
WAXmlDocument >> openTag: aString attributes: anAttributes [
	"Open the XML tag named aString with the attribute dictionary anAttributes."

	self openTag: aString attributes: anAttributes closed: false
]

{ #category : #writing }
WAXmlDocument >> openTag: aString attributes: anAttributes closed: aBoolean [
	"Open the XML tag named aString with the attribute dictionary anAttributes. Immediately close the tag if aBoolean is true."
	
	stream nextPut: $<; nextPutAll: aString.
	anAttributes encodeOn: self.
	aBoolean ifTrue: [ stream nextPut: $/ ].
	stream nextPut: $>
]

{ #category : #writing }
WAXmlDocument >> print: anObject [
	anObject encodeOn: self
]

{ #category : #accessing }
WAXmlDocument >> urlEncoder [
	"Answer an encoder for URL data."

	^ urlEncoder
]

{ #category : #accessing }
WAXmlDocument >> xmlEncoder [
	"Answer an encoder for XML data."

	^ xmlEncoder
]
