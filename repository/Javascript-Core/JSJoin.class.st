"
I join a collection of JavaScript statements with the given string.
"
Class {
	#name : #JSJoin,
	#superclass : #JSObject,
	#instVars : [
		'collection'
	],
	#category : 'Javascript-Core-Base'
}

{ #category : #'instance creation' }
JSJoin class >> new [
	^ self on: OrderedCollection new
]

{ #category : #'instance creation' }
JSJoin class >> on: aCollection [
	^ self basicNew initializeOn: aCollection
]

{ #category : #accessing }
JSJoin >> collection [
	^ collection
]

{ #category : #encoding }
JSJoin >> encodeElement: anObject on: aDocument [
	"We assume that the element is already URL encoded if this is not an association."

	(anObject isKindOf: Association)
		ifTrue: [
			aDocument nextPut: $".
			aDocument urlEncoder
				nextPutAll: anObject key greaseString.
			anObject value isNil 
				ifTrue: [ aDocument nextPut: $" ]
				ifFalse: [
					aDocument nextPut: $=.
					(anObject value isString or: [ anObject value isCharacter ])
						ifTrue: [
							aDocument urlEncoder 
								nextPutAll: anObject value greaseString.
							aDocument nextPut: $" ]
						ifFalse: [
							aDocument nextPutAll: '"+encodeURIComponent('.
							aDocument stream javascript: anObject value.
							aDocument nextPut: $) ] ] ]
		ifFalse: [ aDocument stream javascript: anObject ]
]

{ #category : #encoding }
JSJoin >> encodeEmptyOn: aDocument [
	aDocument nextPutAll: '""'
]

{ #category : #encoding }
JSJoin >> encodeOn: aDocument [
	self collection isEmpty
		ifTrue: [ ^ self encodeEmptyOn: aDocument ].
	self collection size = 1
		ifTrue: [ ^ self encodeElement: self collection first on: aDocument ].
	aDocument nextPut: $[.
	self collection
		do: [ :each | self encodeElement: each on: aDocument ]
		separatedBy: [ aDocument nextPut: $, ].
	aDocument nextPutAll: '].join("&")'
]

{ #category : #initialization }
JSJoin >> initializeOn: aCollection [
	self initialize.
	collection := aCollection
]

{ #category : #printing }
JSJoin >> javascriptContentOn: aStream [
	| document codec |
	codec := [ self requestContext codec ] 
		on: WARequestContextNotFound
		do: [ :e | GRNullCodec new ].
	document := WAUnescapedDocument 
		on: aStream
		codec: codec.
	self encodeOn: document
]
