"
Provides a read-only view onto multiple dictionaries. Note that this can lead to to duplicated keys that can only retrieved by iterating over all the associations.
"
Class {
	#name : #WAMergedRequestFields,
	#superclass : #WAObject,
	#instVars : [
		'delegates'
	],
	#category : 'Seaside-Core-HTTP'
}

{ #category : #'instance creation' }
WAMergedRequestFields class >> new [
	self error: self name , ' is created with #on:'
]

{ #category : #'instance creation' }
WAMergedRequestFields class >> on: anArray [
	^ self basicNew initializeOn: anArray
]

{ #category : #enumerating }
WAMergedRequestFields >> allAt: aKey [
	^ Array streamContents: [ :stream |
		delegates do: [ :each | stream nextPutAll: (each allAt: aKey) ] ]
]

{ #category : #enumerating }
WAMergedRequestFields >> allAt: aKey ifAbsent: absentBlock [
	| result |
	result := self allAt: aKey.
	^ result isEmpty
		ifTrue: [ absentBlock value ]
		ifFalse: [ result ]
]

{ #category : #enumerating }
WAMergedRequestFields >> associationsDo: aBlock [
	delegates do: [ :each | each associationsDo: aBlock ]
]

{ #category : #accessing }
WAMergedRequestFields >> at: aKey [
	^ self at: aKey ifAbsent: [ self errorKeyNotFound ]
]

{ #category : #accessing }
WAMergedRequestFields >> at: aKey ifAbsent: aBlock [
	delegates do: [ :each |
		each
			at: aKey
			ifPresent: [ :value | ^ value ] ].
	^ aBlock value
]

{ #category : #accessing }
WAMergedRequestFields >> at: aKey ifPresent: aBlock [
	delegates do: [ :each |
		each
			at: aKey
			ifPresent: [ :value | ^ aBlock value: value ] ].
	^ nil
]

{ #category : #enumerating }
WAMergedRequestFields >> do: aBlock [
	delegates do: [ :each | each do: aBlock ]
]

{ #category : #private }
WAMergedRequestFields >> errorKeyNotFound [
	^ nil
]

{ #category : #testing }
WAMergedRequestFields >> includesKey: aKey [
	^ delegates anySatisfy: [ :each | each includesKey: aKey ]
]

{ #category : #initialization }
WAMergedRequestFields >> initializeOn: anArray [
	self initialize.
	delegates := anArray
]

{ #category : #testing }
WAMergedRequestFields >> isEmpty [
	^ delegates allSatisfy: [ :each | each isEmpty ]
]

{ #category : #enumerating }
WAMergedRequestFields >> keys [
	^ Array streamContents: [ :stream |
		delegates do: [ :each | stream nextPutAll: each keys ] ]
]

{ #category : #enumerating }
WAMergedRequestFields >> keysAndValuesDo: aBlock [
	delegates do: [ :each | each keysAndValuesDo: aBlock ]
]

{ #category : #enumerating }
WAMergedRequestFields >> keysDo: aBlock [
	delegates do: [ :each | each keysDo: aBlock ]
]

{ #category : #accessing }
WAMergedRequestFields >> size [
	^ delegates inject: 0 into: [ :result :each | result + each size ]
]

{ #category : #enumerating }
WAMergedRequestFields >> values [
	^ Array streamContents: [ :stream |
		delegates do: [ :each | stream nextPutAll: each values ] ]
]
