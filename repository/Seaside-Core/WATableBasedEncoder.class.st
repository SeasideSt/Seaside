"
I encode everything that is written to myself using #nextPut: and #nextPutAll: onto the wrapped stream. The specific encoding that is done is determined by my subclasses (the conversion of a single character is defined in the class-side method #encode:on:).

To be efficient, each subclass uses a cached encoding table to transform the most used characters from the UTF Basic Multilingual Plane.
"
Class {
	#name : 'WATableBasedEncoder',
	#superclass : 'WAEncoder',
	#instVars : [
		'table'
	],
	#classInstVars : [
		'table'
	],
	#category : 'Seaside-Core-Document',
	#package : 'Seaside-Core',
	#tag : 'Document'
}

{ #category : 'private' }
WATableBasedEncoder class >> maximumCharacterValue [
	"find the maximum value of a character that we can instantiate, for Squeak 3.7 this is 255"
	^ [ Character codePoint: 16rFFFF.
		16rFFFF ]
			on: Error
			do: [ :error  | 16rFF ]
]

{ #category : 'instance creation' }
WATableBasedEncoder class >> new [
	^ self on: GRPlatform current readWriteCharacterStream
]

{ #category : 'instance creation' }
WATableBasedEncoder class >> on: aStream [
	^ self on: aStream table: table
]

{ #category : 'instance creation' }
WATableBasedEncoder class >> on: aStream codec: aCodec [
	"For compatibility with WAUrlEncoder"
	^ self on: aStream
]

{ #category : 'instance creation' }
WATableBasedEncoder class >> on: aStream table: anArray [
	^ self basicNew initializeOn: aStream table: anArray; yourself
]

{ #category : 'initialization' }
WATableBasedEncoder >> initializeOn: aStream table: anArray [
	self initializeOn: aStream.
	table := anArray
]

{ #category : 'accessing' }
WATableBasedEncoder >> nextPutAll: aString [ 
	"uses #to:do: for speed reasons (on Pharo)
	this is not premature optimization, this is a hotspot method method
	and #to:do: shows measurable speed improvements for rendering seaside pages"
	1 to: aString size do: [ :index |
		self nextPut: (aString at: index) ]
]
