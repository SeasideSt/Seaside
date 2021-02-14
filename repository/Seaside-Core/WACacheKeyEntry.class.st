"
I am an entry in the table of WAHashCache.

Besides keys and values I keep track of linked list entries so they can be removed without scanning the list.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	byAccessListEntry:		<WACacheListEntry>
	byCreationListEntry:		<WACacheListEntry>
	key:		<Object>
	keyHash:		<Integer>
	next:		<WACacheKeyEntry>
	value:		<Object>

"
Class {
	#name : #WACacheKeyEntry,
	#superclass : #WAObject,
	#instVars : [
		'key',
		'keyHash',
		'value',
		'next',
		'byAccessListEntry',
		'byCreationListEntry'
	],
	#category : 'Seaside-Core-Cache'
}

{ #category : #'instance creation' }
WACacheKeyEntry class >> key: aKey value: anObject [
	^ self basicNew
		initializeWithKey: aKey value: anObject;
		yourself
]

{ #category : #accessing }
WACacheKeyEntry >> byAccessListEntry [
	^ byAccessListEntry
]

{ #category : #accessing }
WACacheKeyEntry >> byAccessListEntry: aCacheListEntry [
	byAccessListEntry := aCacheListEntry
]

{ #category : #accessing }
WACacheKeyEntry >> byCreationListEntry [
	^ byCreationListEntry
]

{ #category : #accessing }
WACacheKeyEntry >> byCreationListEntry: aCacheListEntry [
	byCreationListEntry := aCacheListEntry
]

{ #category : #initialization }
WACacheKeyEntry >> initializeWithKey: aKey value: anObject [
	self initialize.
	key := aKey.
	keyHash := aKey hash.
	value := anObject
]

{ #category : #accessing }
WACacheKeyEntry >> key [
	^ key
]

{ #category : #accessing }
WACacheKeyEntry >> keyHash [
	^ keyHash
]

{ #category : #accessing }
WACacheKeyEntry >> next [
	^ next
]

{ #category : #accessing }
WACacheKeyEntry >> next: aCacheKeyEntry [
	next := aCacheKeyEntry
]

{ #category : #printing }
WACacheKeyEntry >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	key printOn: aStream.
	aStream nextPutAll: ' -> '.
	value printOn: aStream.
	aStream nextPut: $)
]

{ #category : #accessing }
WACacheKeyEntry >> value [
	^ value
]

{ #category : #accessing }
WACacheKeyEntry >> value: anObject [
	value := anObject
]
