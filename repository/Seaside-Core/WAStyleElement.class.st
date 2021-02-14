"
The style element allows style information to be embedded in documents.
"
Class {
	#name : #WAStyleElement,
	#superclass : #WAHtmlElement,
	#category : 'Seaside-Core-Document-Elements'
}

{ #category : #testing }
WAStyleElement >> isClosed [
	^ false
]

{ #category : #attributes }
WAStyleElement >> media: aString [ 
	"Specifies which media the styles apply to.
	A valid media query list as defined in [Media Queries]."
	
	self attributes at: 'media' put: aString
]

{ #category : #accesing }
WAStyleElement >> tag [
	^ 'style'
]

{ #category : #attributes }
WAStyleElement >> type: aString [ 
	"A valid MIME type that designates a styling language.
	A string that identifies a valid MIME media type as defined in [RFC 2046]."
	
	self attributes at: 'type' put: aString
]
