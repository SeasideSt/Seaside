Class {
	#name : #WACacheListEntry,
	#superclass : #WAObject,
	#instVars : [
		'previous',
		'next',
		'time',
		'cacheEntry'
	],
	#category : 'Seaside-Core-Cache'
}

{ #category : #'instance creation' }
WACacheListEntry class >> entry: aCacheEntry [
	^ self basicNew
		initializeWithEntry: aCacheEntry;
		yourself
]

{ #category : #accessing }
WACacheListEntry >> cacheEntry [
	^ cacheEntry
]

{ #category : #operations }
WACacheListEntry >> expunge [
	next isNil ifFalse: [
		next previous: previous ].
	previous isNil ifFalse: [
		previous next: next ].
	next := nil.
	previous := nil
]

{ #category : #operations }
WACacheListEntry >> initializeTime [
	time := Time totalSeconds
]

{ #category : #initialization }
WACacheListEntry >> initializeWithEntry: aCacheEntry [
	self initialize.
	cacheEntry := aCacheEntry.
	self initializeTime
]

{ #category : #accessing }
WACacheListEntry >> next [
	^ next
]

{ #category : #accessing }
WACacheListEntry >> next: aCacheListEntry [
	next := aCacheListEntry
]

{ #category : #accessing }
WACacheListEntry >> previous [
	^ previous
]

{ #category : #accessing }
WACacheListEntry >> previous: aCacheListEntry [
	previous := aCacheListEntry
]

{ #category : #accessing }
WACacheListEntry >> time [
	^ time
]
