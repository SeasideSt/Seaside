"
I join a collection of JavaScript statements with the given string.
"
Class {
	#name : 'JSJoin',
	#superclass : 'JSObject',
	#instVars : [
		'collection'
	],
	#category : 'Javascript-Core-Base',
	#package : 'Javascript-Core',
	#tag : 'Base'
}

{ #category : 'instance creation' }
JSJoin class >> new [
	^ self on: OrderedCollection new
]

{ #category : 'instance creation' }
JSJoin class >> on: aCollection [
	^ self basicNew initializeOn: aCollection
]

{ #category : 'accessing' }
JSJoin >> collection [
	^ collection
]

{ #category : 'encoding' }
JSJoin >> encodeAssociation: anAssociation on: aRenderer [
	| key value |
	"key -> nil: ""key""
	 key -> aString: ""key=aString(urlEncoded)""
	key -> anObject: ""key=""+encodeURIComponent(anObject)"
	key := anAssociation key.
	value := anAssociation value.
	aRenderer document
		beginString
		urlEncode: key greaseString.
	value isNil ifTrue: [
		aRenderer document endString.
		^ self ].
	
	aRenderer document nextPut: $=.
	(value isString or: [ value isCharacter ]) ifTrue: [
		aRenderer document
				urlEncode: value greaseString;
				endString	.
		^ self ].
	aRenderer document
		endString;
		operator: '+'.
	aRenderer encodeURIComponent: value
]

{ #category : 'encoding' }
JSJoin >> encodeElement: anObject on: aRenderer [

	(anObject isKindOf: Association)
		ifTrue: [
			self encodeAssociation: anObject on: aRenderer ]
		ifFalse: [
			"We assume that the element is already URL encoded if this is not an association."
			aRenderer render: anObject ]
]

{ #category : 'encoding' }
JSJoin >> encodeEmptyOn: aRenderer [
	aRenderer string: ''
]

{ #category : 'initialization' }
JSJoin >> initializeOn: aCollection [
	self initialize.
	collection := aCollection
]

{ #category : 'printing' }
JSJoin >> javascriptContentOn: aRenderer [
	self collection isEmpty
		ifTrue: [ ^ self encodeEmptyOn: aRenderer ].
	self collection size = 1
		ifTrue: [ ^ self encodeElement: self collection first on: aRenderer ].
	aRenderer array: [
		self collection do: [ :each |
			aRenderer value: [
				self encodeElement: each on: aRenderer ] ] ].
	(aRenderer document dotProperty: 'join').
	aRenderer arguments: [ 
		aRenderer string: '&' ]
]
