Class {
	#name : 'ZnRingBufferTest',
	#superclass : 'TestCase',
	#category : 'Seaside-Zinc-Tests',
	#package : 'Seaside-Zinc-Tests'
}

{ #category : 'tests' }
ZnRingBufferTest >> testAt [
	| buffer |
	buffer := GRPlatform current ringBufferClass new: 5.
	self assert: (buffer at: 1) isNil.
	
	buffer
		at: 1
		put: 1.
	self assert: (buffer at: 1) equals: 1.
	
	buffer
		at: 2
		put: 2.
	self assert: (buffer at: 2) equals: 2.
	
	buffer
		at: 5
		put: 6.
	self assert: (buffer at: 3) isNil.
	self assert: (buffer at: 4) isNil.
	self assert: (buffer at: 5) equals: 6
]

{ #category : 'tests' }
ZnRingBufferTest >> testAtOutOfBounds [
	| buffer |
	buffer := GRPlatform current ringBufferClass new: 5.
	self
		should: [ buffer at: 0 ]
		raise: ZnRingBufferIllegalAccess.
	self
		should: [ buffer at: -1 ]
		raise: ZnRingBufferIllegalAccess.
	self
		should: [ buffer at: 6 ]
		raise: ZnRingBufferIllegalAccess
]

{ #category : 'tests' }
ZnRingBufferTest >> testCopyFromTo [
	| buffer copy |
	buffer := GRPlatform current ringBufferClass on: #(1 2 3 4).
	copy := buffer
		copyFrom: 2
		to: 4.
		
	self assert: copy equals: #(2 3 4).
	
	copy := buffer
		copyFrom: 1
		to: 4.
		
	self assert: copy equals: #(1 2 3 4).
	
	buffer moveStartTo: 2.
	copy := buffer
		copyFrom: 2
		to: 4.
		
	self assert: copy equals: #(3 4 1).
	
	buffer moveStartTo: 2.
	copy := buffer
		copyFrom: 2
		to: 4.
		
	self assert: copy equals: #(4 1 2)
]

{ #category : 'tests' }
ZnRingBufferTest >> testDo [
	| buffer collector |
	buffer := GRPlatform current ringBufferClass new: 5.
	buffer
		at: 1 put: 1;
		at: 5 put: 2.
	collector := OrderedCollection new.
	buffer do: [ :value | collector add: value ].
	self assert: collector asArray equals: #(1 nil nil nil 2).
	
	buffer moveStartTo: 2.
	collector := OrderedCollection new.
	buffer do: [ :value | collector add: value ].
	self assert: collector asArray equals: #(nil nil nil 2 1)
]

{ #category : 'tests' }
ZnRingBufferTest >> testEquals [
	"We use #= on purpose in this test because the test
	only works one way."
	| buffer |
	buffer := GRPlatform current ringBufferClass new: 3.
	self assert: buffer = #(nil nil nil).
	
	buffer
		at: 1
		put: 1.
	self assert: buffer = #(1 nil nil).
	
	buffer moveStartTo: 2.
	self assert: buffer = #(nil nil 1)
]

{ #category : 'tests' }
ZnRingBufferTest >> testIllegalInstantiation [
	self
		should: [ GRPlatform current ringBufferClass new ]
		raise: ZnRingBufferIllegalUse
]

{ #category : 'tests' }
ZnRingBufferTest >> testIndexOf [
	| buffer index |
	buffer := GRPlatform current ringBufferClass new: 5.
	buffer
		at: 2
		put: 1.
	
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 2.
	
	buffer moveStartTo: 2.
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 1.
	
	buffer moveStartTo: 2.
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 5.
	
	buffer moveStartTo: 2.
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 4.
	
	buffer moveStartTo: 2.
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 3.
	
	buffer moveStartTo: 2.
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 2
]

{ #category : 'tests' }
ZnRingBufferTest >> testIndexOfIfAbsent [
	| buffer index |
	buffer := GRPlatform current ringBufferClass new: 5.
	buffer
		at: 2
		put: 1.
	
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 2.
	
	buffer moveStartTo: 2.
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 1.
	
	buffer moveStartTo: 2.
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 5.
	
	buffer moveStartTo: 2.
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 4.
	
	buffer moveStartTo: 2.
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 3.
	
	buffer moveStartTo: 2.
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 2
]

{ #category : 'tests' }
ZnRingBufferTest >> testIndexOfIfAbsentWhenAbsent [
	| buffer index |
	buffer := GRPlatform current ringBufferClass new: 5.
	
	index := buffer
		indexOf: 1
		ifAbsent: [ 2 ].
	self assert: index equals: 2
]

{ #category : 'tests' }
ZnRingBufferTest >> testMoveStartTo [
	| buffer |
	buffer := GRPlatform current ringBufferClass new: 5.
	
	buffer
		at: 1 put: 1;
		at: 5 put: 5.
	buffer moveStartTo: 2.
	self assert: (buffer at: 1) isNil.
	self assert: (buffer at: 4) equals: 5.
	self assert: (buffer at: 5) equals: 1.
	
	buffer moveStartTo: 5.
	self assert: (buffer at: 1) equals: 1.
	self assert: (buffer at: 5) equals: 5.
	
	buffer moveStartTo: 5.
	self assert: (buffer at: 1) equals: 5.
	self assert: (buffer at: 2) equals: 1
]

{ #category : 'tests' }
ZnRingBufferTest >> testMoveStartToIdentity [
	| buffer |
	buffer := GRPlatform current ringBufferClass new: 5.
	
	buffer
		at: 1 put: 1;
		moveStartTo: 1.
	self assert: (buffer at: 1) equals: 1
]

{ #category : 'tests' }
ZnRingBufferTest >> testMoveStartToOutOfBounds [
	| buffer |
	buffer := GRPlatform current ringBufferClass new: 5.
	self
		should: [ buffer moveStartTo: 0 ]
		raise: ZnRingBufferIllegalAccess.
	self
		should: [ buffer moveStartTo: -1 ]
		raise: ZnRingBufferIllegalAccess.
	self
		should: [ buffer moveStartTo: 6 ]
		raise: ZnRingBufferIllegalAccess
]

{ #category : 'tests' }
ZnRingBufferTest >> testNextPutAllOn [

	| buffer temporaryFile |
	buffer := GRPlatform current ringBufferClass on: (ByteArray new: 4).
	buffer
		at: 1 put: 128;
		at: 2 put: 129;
		at: 3 put: 130;
		at: 4 put: 131.
	temporaryFile := GRPlatform current newTemporaryFile.
	[
		GRPlatform current
			writeFileStreamOn: temporaryFile
			do: [ :strm | buffer nextPutAllOn: strm ]
			binary: true.
		self assert: (GRPlatform current contentsOfFile: temporaryFile binary: true) equals: #[128 129 130 131]
	] ensure: [ GRPlatform current deleteFile: temporaryFile ].

	buffer moveStartTo: 3.
	temporaryFile := GRPlatform current newTemporaryFile.
	[
		GRPlatform current
			writeFileStreamOn: temporaryFile
			do: [ :strm | buffer nextPutAllOn: strm ]
			binary: true.
		self assert: (GRPlatform current contentsOfFile: temporaryFile binary: true) equals: #[130 131 128 129]
	] ensure: [ GRPlatform current deleteFile: temporaryFile ].
]

{ #category : 'tests' }
ZnRingBufferTest >> testOn [
	| buffer |
	buffer := GRPlatform current ringBufferClass on: (ByteArray new: 1).
	self assert: buffer size equals: 1.
	buffer
		at: 1
		put: 1.
	self
		should: [ buffer at: 1 put: $a ]
		raise: Error
]

{ #category : 'tests' }
ZnRingBufferTest >> testReplaceFromToWithStartingAt [
	| buffer replacement |
	replacement := #(1 2 3 4).
	1
		to: 5
		do: [ :index |
			buffer := GRPlatform current ringBufferClass new: 5.
			buffer moveStartTo: index.
			buffer
				replaceFrom: 2
				to: 4
				with: replacement
				startingAt: 2.
				
			self assert: (buffer at: 1) isNil.
			self assert: (buffer at: 2) equals: 2.
			self assert: (buffer at: 3) equals: 3.
			self assert: (buffer at: 4) equals: 4.
			self assert: (buffer at: 5) isNil ]
]

{ #category : 'tests' }
ZnRingBufferTest >> testSize [
	| buffer |
	buffer := GRPlatform current ringBufferClass new: 2.
	self assert: buffer size equals: 2.
	
	buffer
		at: 1 put: 1;
		at: 1 put: 1.
	self assert: buffer size equals: 2.
	
	buffer
		moveStartTo: 2;
		at: 1 put: 3.
	self assert: buffer size equals: 2
]
