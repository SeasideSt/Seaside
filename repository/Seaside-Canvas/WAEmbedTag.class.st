"
The <embed> tag defines a container for an external application or interactive content (a plug-in).
"
Class {
	#name : #WAEmbedTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WAEmbedTag >> height: anInteger [
	self attributeAt: 'height' put: anInteger
]

{ #category : #accessing }
WAEmbedTag >> tag [
	^ 'embed'
]

{ #category : #attributes }
WAEmbedTag >> type: aMimeType [
	self attributeAt: 'type' put: aMimeType
]

{ #category : #attributes }
WAEmbedTag >> url: aString [
	"The src attribute gives the address of the resource being embedded."
	self attributeAt: 'src' put: aString
]

{ #category : #attributes }
WAEmbedTag >> width: anInteger [
	self attributeAt: 'width' put: anInteger
]
