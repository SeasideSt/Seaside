"
A WAUnescapedDocument does not do any escaping.
"
Class {
	#name : 'WAUnescapedDocument',
	#superclass : 'WAXmlDocument',
	#category : 'Seaside-Core-Document',
	#package : 'Seaside-Core',
	#tag : 'Document'
}

{ #category : 'initialization' }
WAUnescapedDocument >> initializeWithStream: aStream codec: aCodec [
	super initializeWithStream: aStream codec: aCodec.
	xmlEncoder := aStream
]
