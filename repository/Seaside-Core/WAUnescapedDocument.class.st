"
A WAUnescapedDocument is does not do any escaping.
"
Class {
	#name : #WAUnescapedDocument,
	#superclass : #WAXmlDocument,
	#category : 'Seaside-Core-Document'
}

{ #category : #initialization }
WAUnescapedDocument >> initializeWithStream: aStream codec: aCodec [
	super initializeWithStream: aStream codec: aCodec.
	xmlEncoder := aStream
]
