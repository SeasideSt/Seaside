"
I am an item within the memory usage tool.
"
Class {
	#name : #WAMemoryItem,
	#superclass : #WAObject,
	#instVars : [
		'class',
		'count',
		'size'
	],
	#category : 'Seaside-Pharo-Development-Core'
}

{ #category : #'instance creation' }
WAMemoryItem class >> on: aClass [
	^ self basicNew initializeOn: aClass
]

{ #category : #public }
WAMemoryItem >> accumulate: anObject [
	count := count + 1.
	size := size + (self sizeOfObject: anObject)
]

{ #category : #accessing }
WAMemoryItem >> count [
	^ count
]

{ #category : #initialization }
WAMemoryItem >> initializeOn: aClass [
	self initialize.
	class := aClass.
	count := size := 0
]

{ #category : #accessing }
WAMemoryItem >> name [
	^ class name
]

{ #category : #accessing }
WAMemoryItem >> size [
	^ size
]

{ #category : #private }
WAMemoryItem >> sizeOfObject: anObject [
	^ anObject sizeInMemory
]
