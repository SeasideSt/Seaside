Class {
	#name : #WAKeyGenerator,
	#superclass : #WAObject,
	#instVars : [
		'generator',
		'space'
	],
	#classInstVars : [
		'current'
	],
	#category : 'Seaside-Core-Utilities'
}

{ #category : #accessing }
WAKeyGenerator class >> current [
	^ current
]

{ #category : #accessing }
WAKeyGenerator class >> current: aWAKeyGenerator [
	current := aWAKeyGenerator
]

{ #category : #initialization }
WAKeyGenerator class >> initialize [
	current := self new
]

{ #category : #accessing }
WAKeyGenerator >> generator: aStream [
	"A stream of random numbers, basically a random generator."

	generator := aStream
]

{ #category : #initialization }
WAKeyGenerator >> initialize [
	super initialize.
	self generator: GRPlatform current newRandom.
	self space: 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-'
]

{ #category : #public }
WAKeyGenerator >> keyOfLength: anInteger [
	"Answer a random key as a string with the length anInteger. This does not use any of the fancy collection methods for speed reasons."

	| key |
	key := String new: anInteger.
	1 to: anInteger do: [ :index | key at: index put: (space at: (generator nextInt: space size)) ].
	^ key
]

{ #category : #accessing }
WAKeyGenerator >> space: aCollectionOfCharacters [
	"Defines the key generator space."

	space := aCollectionOfCharacters
]
