"
I am an implementation of a ring buffer, i.e. a buffer where the start index can be moved along a virtual ring.

I buffer a fixed amount of data and provide array like access to it.

Users use me mostly like an array. My only interesting method is #moveStartTo:, which moves the start index of the buffer to the specified position. Example:

buffer
	at: 1 put: 1;
	at: 2 put: 2;
	at: 1. ""----> 1""
	
buffer
	moveStartTo: 2;
	at: 1 ""----> 2""
"
Class {
	#name : 'ZnRingBuffer',
	#superclass : 'Object',
	#instVars : [
		'buffer',
		'offset'
	],
	#category : 'Seaside-Zinc-Core',
	#package : 'Seaside-Zinc-Core'
}

{ #category : 'instance creation' }
ZnRingBuffer class >> new [
	ZnRingBufferIllegalUse signal: 'Use #new and specify an explicit size'
]

{ #category : 'instance creation' }
ZnRingBuffer class >> new: aInteger [
	^ self basicNew
		initialize: aInteger;
		initialize;
		yourself
]

{ #category : 'instance creation' }
ZnRingBuffer class >> on: aCollection [
	^ self basicNew
		initializeWithCollection: aCollection;
		initialize;
		yourself
]

{ #category : 'comparing' }
ZnRingBuffer >> = aCollection [
	1
		to: self size
		do: [ :index |
			(self at: index) ~= (aCollection at: index) ifTrue: [ ^ false ] ].
		
	^ true
]

{ #category : 'accessing' }
ZnRingBuffer >> at: anInteger [

	| wrappedPosition |
	self checkBoundsFor: anInteger.
	wrappedPosition := ((anInteger + offset - 1) rem: buffer size) + 1.
	^ buffer at: wrappedPosition
]

{ #category : 'accessing' }
ZnRingBuffer >> at: anInteger put: anObject [

	| wrappedPosition |
	self checkBoundsFor: anInteger.
	wrappedPosition := ((anInteger + offset - 1) rem: buffer size) + 1.
	buffer
		at: wrappedPosition
		put: anObject
]

{ #category : 'private' }
ZnRingBuffer >> checkBoundsFor: anInteger [
	(anInteger < 1 or: [
		anInteger > self size ]) ifFalse: [ ^ self ].
	
	ZnRingBufferIllegalAccess signal
]

{ #category : 'accessing' }
ZnRingBuffer >> copyFrom: start to: stop [
	| copy endIndex copySize |
	copySize := stop - start + 1.
	copy := buffer species new: copySize.
	endIndex := copySize min: self size - start - offset + 1.
	copy
		replaceFrom: 1
		to: endIndex
		with: buffer
		startingAt: start + offset.
		
	stop + offset > self size ifFalse: [ ^ copy ].
	
	^ copy
		replaceFrom: endIndex + 1
		to: copySize
		with: buffer
		startingAt: 1
]

{ #category : 'enumerating' }
ZnRingBuffer >> do: aBlock [
	1
		to: self size
		do: [ :index |
			aBlock value: (self at: index) ]
]

{ #category : 'comparing' }
ZnRingBuffer >> hash [
	"Copy of SequenceableCollection>>hash"
	| hash |
	hash := self species hash.
	1
		to: self size
		do: [ :i | hash := (hash + (self at: i) hash) hashMultiply ].
	^ hash
]

{ #category : 'accessing' }
ZnRingBuffer >> indexOf: anElement ifAbsent: exceptionBlock [
	| index |
	index := buffer
		indexOf: anElement
		ifAbsent: [ ^ exceptionBlock value ].
		
	^ index > offset
		ifTrue: [ index - offset ]
		ifFalse: [ self size - offset + index ]
]

{ #category : 'initialization' }
ZnRingBuffer >> initialize [
	super initialize.
	
	offset := 0
]

{ #category : 'initialization' }
ZnRingBuffer >> initialize: anInteger [
	self initializeWithCollection: (Array new: anInteger)
]

{ #category : 'initialization' }
ZnRingBuffer >> initializeWithCollection: aCollection [
	buffer := aCollection.
	offset := 0
]

{ #category : 'operations' }
ZnRingBuffer >> moveStartTo: anInteger [
	self checkBoundsFor: anInteger.
	
	offset := (offset + anInteger - 1) \\ self size
]

{ #category : 'operations' }
ZnRingBuffer >> nextPutAllOn: aStream [

	self do: [ :element | aStream nextPut: element ]
]

{ #category : 'printing' }
ZnRingBuffer >> printOn: aStream [
	super printOn: aStream.
	
	aStream nextPut: $(.
	(self
		copyFrom: 1
		to: self size) printOn: aStream.
	aStream nextPut: $)
]

{ #category : 'accessing' }
ZnRingBuffer >> replaceFrom: start to: stop with: replacement startingAt: repStart [
	| startIndex endIndex |
	startIndex := start + offset.
	endIndex := stop + offset min: self size.
	startIndex > self size ifFalse: [
		buffer
			replaceFrom: startIndex
			to: endIndex
			with: replacement
			startingAt: repStart ].
		
	stop + offset > self size ifFalse: [ ^ self ].
	
	buffer
		replaceFrom: 1
		to: (stop + offset) \\ self size
		with: replacement
		startingAt: repStart + endIndex - startIndex + 1
]

{ #category : 'accessing' }
ZnRingBuffer >> size [
	^ buffer size
]
