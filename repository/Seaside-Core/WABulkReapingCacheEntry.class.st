"
I am a value in a WABulkReapingCache. It's important that my values are not concurrently updated in order to avoid commit conflicts on GemStone/S.

accessTime:		only set by reaper
creationTime:	immutable, set only once
value:			immutable, set only once
lastCount:		only set by reaper
count:			updated concurrently but this is not an issue since we use a WAReducedConflictCounter

    Instance Variables
	count:			<WAReducedConflictCounter>
	lastCount:		<Integer>
	creationTime:	<Integer>
	accessTime:		<Integer>
	value:			<Object>

"
Class {
	#name : #WABulkReapingCacheEntry,
	#superclass : #WAObject,
	#instVars : [
		'value',
		'creationTime',
		'accessTime',
		'count',
		'lastCount'
	],
	#category : 'Seaside-Core-Cache'
}

{ #category : #'instance creation' }
WABulkReapingCacheEntry class >> value: anObject [
	^ self basicNew
		initializeWithValue: anObject;
		yourself
]

{ #category : #accessing }
WABulkReapingCacheEntry >> accessTime [
	^ accessTime
]

{ #category : #accessing }
WABulkReapingCacheEntry >> creationTime [
	^ creationTime
]

{ #category : #testing }
WABulkReapingCacheEntry >> hasBeenAccessedSinceLastReap [
	^ count value > lastCount
]

{ #category : #public }
WABulkReapingCacheEntry >> incrementCount [
	count increment
]

{ #category : #initialization }
WABulkReapingCacheEntry >> initializeWithValue: anObject [
	| now |
	self initialize.
	value := anObject.
	now := Time totalSeconds.
	creationTime := now.
	accessTime := now.
	count := GRPlatform current newReducedConflictCounter.
	lastCount := 0
]

{ #category : #public }
WABulkReapingCacheEntry >> setAccessTime: anInteger [
	accessTime := anInteger.
	lastCount := count value
]

{ #category : #accessing }
WABulkReapingCacheEntry >> value [
	^ value
]

{ #category : #accessing }
WABulkReapingCacheEntry >> value: anObject [
	| now |
	now := Time totalSeconds.
	accessTime := now.
	creationTime := now.
	value := anObject
]
