"
I represent a verbatim JavaScript string. I support streaming facilities to efficiently encode JavaScript input.
"
Class {
	#name : 'JSStream',
	#superclass : 'JSObject',
	#instVars : [
		'fragments'
	],
	#classVars : [
		'Arguments',
		'This'
	],
	#category : 'Javascript-Core-Base',
	#package : 'Javascript-Core',
	#tag : 'Base'
}

{ #category : 'instance creation' }
JSStream class >> argument: anInteger [
	^ (Arguments at: anInteger + 1) copy
]

{ #category : 'instance creation' }
JSStream class >> argumentAt: anInteger [
	^ (Arguments at: anInteger) copy
]

{ #category : 'initialization' }
JSStream class >> initialize [

	self initializeSnippets
]

{ #category : 'initialization' }
JSStream class >> initializeSnippets [
	This := self on: 'this'.
	Arguments := (0 to: 25)
		collect: [ :each | self on: 'arguments[' , each printString , ']' ]
]

{ #category : 'instance creation' }
JSStream class >> on: aString [
	^ self new nextPutAll: aString
]

{ #category : 'instance creation' }
JSStream class >> this [
	^ This copy
]

{ #category : 'instance creation' }
JSStream class >> withFragments: anObject [
	^ self basicNew initializeWithFragments: anObject
]

{ #category : 'private' }
JSStream >> add: anObject [

	fragments add: anObject
]

{ #category : 'convenience' }
JSStream >> argument: anObject [

	self add: (JSArgument with: anObject)
]

{ #category : 'convenience' }
JSStream >> arguments: aCollection [

	self add: (JSArguments withAll: aCollection)
]

{ #category : 'copying' }
JSStream >> copy [

	^ self class withFragments: fragments copy
]

{ #category : 'initialization' }
JSStream >> initialize [

	super initialize.
	renderContext := WARenderContext new.
	fragments := OrderedCollection new: 2
]

{ #category : 'initialization' }
JSStream >> initializeWithFragments: anObject [

	super initialize.
	renderContext := WARenderContext new.
	fragments := anObject
]

{ #category : 'streaming' }
JSStream >> javascript: anObject [

	self add: anObject
]

{ #category : 'printing' }
JSStream >> javascriptContentOn: aRenderer [

	fragments do: [ :each |
		aRenderer render: each ]
]

{ #category : 'streaming' }
JSStream >> json: anObject [

	self nextPutAll: anObject asJson
]

{ #category : 'streaming' }
JSStream >> nextPut: aCharacter [

	"quite inefficient, ideally rare"
	self add: (JSCode on: aCharacter greaseString)
]

{ #category : 'streaming' }
JSStream >> nextPutAll: aString [

	self add: (JSCode on: aString)
]
