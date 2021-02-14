Class {
	#name : #WAMemoryItemTest,
	#superclass : #TestCase,
	#instVars : [
		'item'
	],
	#category : 'Seaside-Tests-Pharo-Development'
}

{ #category : #asserting }
WAMemoryItemTest >> assert: anObject equals: anOtherObject [
	self
		assert: anObject = anOtherObject
		description: anObject greaseString, ' expected to be ', anOtherObject greaseString
		resumable: true
]

{ #category : #asserting }
WAMemoryItemTest >> assert: anObject equalsAny: aCollection [
	self
		assert: (aCollection includes: anObject)
		description: anObject greaseString, ' expected to be any of ', aCollection greaseString
		resumable: true
]

{ #category : #running }
WAMemoryItemTest >> setUp [
	item := WAMemoryItem new
]

{ #category : #testing }
WAMemoryItemTest >> testSizeOneInstanceVariable [
	"16 on 64bit
	12 on 32bit"
	self assert: (item sizeOfObject: WAValueHolder new) equalsAny: #(12 16) 
]

{ #category : #testing }
WAMemoryItemTest >> testSizeStringPadding [
	"16 in Pharo 7 64 bit
	12 in Pharo 5.0 (Spur VM)
	8 in Pharo 3.0 and 4.0
	earlier versions answer 6"
	self assert: (item sizeOfObject: 'aaaa') equalsAny: #(6 8 12 16)
]

{ #category : #testing }
WAMemoryItemTest >> testSizeVariableBytes [
	"Pharo versions older than 3.0 are buggy and answer 9 instead of 12
	64 bit versions answer 16.
	http://code.google.com/p/pharo/issues/detail?id=6440"
	self assert: (item sizeOfObject: (ByteArray new: 1)) equalsAny: #(9 12 16)
	

]

{ #category : #testing }
WAMemoryItemTest >> testSizeVariableBytesLarge [
	self assert: (item sizeOfObject: (ByteArray new: 256)) equalsAny: #(264 268)
]

{ #category : #testing }
WAMemoryItemTest >> testSizeVariableWords [
	"Is 16 in Pharo 7 64bit
	Is 12 in Pharo5 (Spur VM)"
	self assert: (item sizeOfObject: (Array new: 1)) equalsAny: #(8 12 16)
]
