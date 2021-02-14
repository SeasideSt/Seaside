"
Common superclass of all elements inside a <head> that can have content. Either between the start and end tag or a (mime) document pointed to by an URL.
"
Class {
	#name : #WAContentElement,
	#superclass : #WAHtmlElement,
	#category : 'Seaside-Core-Document-Elements'
}

{ #category : #attributes }
WAContentElement >> charset: aString [
	self attributeAt: 'charset' put: aString
]

{ #category : #attributes }
WAContentElement >> contents: aString [
	self document: aString
]

{ #category : #printing }
WAContentElement >> encodeChildrenOn: aDocument [ 
	children isEmptyOrNil ifTrue: [ ^ self ].
	children do: [ :each | aDocument nextPutAll: each greaseString ]
]

{ #category : #testing }
WAContentElement >> isClosed [
	^ false
]

{ #category : #attributes }
WAContentElement >> resourceUrl: aString [
	self url: (root absoluteUrlForResource: aString)
]

{ #category : #attributes }
WAContentElement >> type: aMimeTypeOrString [
	self attributeAt: 'type' put: aMimeTypeOrString
]

{ #category : #private }
WAContentElement >> typeOrNil [
	^ self attributeAt: 'type' ifAbsent:  [ nil ]
]

{ #category : #attributes }
WAContentElement >> url: aString [
	self subclassResponsibility
]
