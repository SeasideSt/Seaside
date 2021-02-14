"
I am a cache that reaps all elements at once instead of incrementally.

I am intended to be used in GemStone/S instead of WAHashCache. A background process should send #reap to me.

    Instance Variables
	dictionary:		<Dictionary>
"
Class {
	#name : #WABulkReapingCache,
	#superclass : #WAExpiringCache,
	#instVars : [
		'dictionary'
	],
	#category : 'Seaside-Core-Cache'
}

{ #category : #accessing }
WABulkReapingCache >> at: aKey ifAbsent: aBlock [
	| entry |
	entry := dictionary at: aKey ifAbsent: [ ^ aBlock value ].
	entry incrementCount.
	^ entry value
]

{ #category : #putting }
WABulkReapingCache >> at: aKey put: anObject [
	| present value |
	present := false.
	value := WABulkReapingCacheEntry value: anObject.
	dictionary
		at: aKey
		ifAbsentPut: [ present := true. value ].
	present ifTrue: [
		^ anObject ].
	dictionary at: aKey put: value.
	^ anObject
]

{ #category : #public }
WABulkReapingCache >> clear [
	dictionary do: [ :value |
		self cacheEntryRemoved: value value ].
	dictionary removeAll
]

{ #category : #initialization }
WABulkReapingCache >> initializeWithInitialSize: aSizeInteger maximumSize: aMaximumSizeInteger maximumAbsoluteAge: aMaximumAbsoluteAge maximumRelativeAge: aMaximumRelativeAge overflowAction: aOverflowActionSymbol [
	super initializeWithInitialSize: aSizeInteger maximumSize: aMaximumSizeInteger maximumAbsoluteAge: aMaximumAbsoluteAge maximumRelativeAge: aMaximumRelativeAge overflowAction: aOverflowActionSymbol.
	dictionary := GRPlatform current reducedConflictDictionary new
]

{ #category : #private }
WABulkReapingCache >> isExpired: aCacheEntry [
	^ self isExpired: aCacheEntry now: Time totalSeconds
]

{ #category : #private }
WABulkReapingCache >> isExpired: aCacheEntry now: currentSeconds [
	(maximumAbsoluteAge > 0 and: [ (currentSeconds- aCacheEntry creationTime) > maximumAbsoluteAge ])
		ifTrue: [ ^ true ].
	
	(maximumRelativeAge > 0 and: [ (currentSeconds - aCacheEntry accessTime) > maximumRelativeAge ])
		ifTrue: [ ^ true ].
		
	^ false
]

{ #category : #enumerating }
WABulkReapingCache >> keysAndValuesDo: aTwoArgumentBlock [
	dictionary keysAndValuesDo: [ :key :value |
		 aTwoArgumentBlock value: key value: value value ]
]

{ #category : #copying }
WABulkReapingCache >> postCopy [
	| oldDictionary |
	super postCopy.
	oldDictionary := dictionary.
	dictionary := GRPlatform current reducedConflictDictionary new.
	oldDictionary keysAndValuesDo: [ :key :value |
		dictionary at: key put: value copy "shallow copy is enough" ]
]

{ #category : #public }
WABulkReapingCache >> reap [
	"Iterate through the cache and remove objects that have expired. Returns the number of expired objects."
	
	| now platform count expiredEntries |
	now := Time totalSeconds.
	expiredEntries := OrderedCollection new.
	
	dictionary keysAndValuesDo: [ :key :value |
		value hasBeenAccessedSinceLastReap ifTrue: [
			value setAccessTime: now ].
		(self isExpired: value now: now) ifTrue: [
			expiredEntries add: key ] ].
	
	"In GemStone, this method is performed by a separate maintenance VM, 
	so we are already in transaction (assumed to be running in #autoBegin 
	transactionMode) and do not have to worry about acquiring the TransactionMutex.
	Since we are using reducedConflict dictionaries in the first place, we will remove the keys
	and values from the existing dictionaries without using the mutex."
	
	count := 0.
	platform := GRPlatform current.
	expiredEntries do:[ :key |
		| value |
		value := dictionary removeKey: key.
		self cacheEntryRemoved: value value.
		count := count + 1.
		(count \\ 100) isZero ifTrue: [
			platform doCommitTransaction ] ].
	(count \\ 100) isZero ifFalse: [
		platform doCommitTransaction ].
	^ count
]

{ #category : #removing }
WABulkReapingCache >> removeKey: aKey [
	| entry value |
	entry := dictionary removeKey: aKey.
	value := entry value.
	self cacheEntryRemoved: value.
	^ value
]

{ #category : #accessing }
WABulkReapingCache >> size [
	^ dictionary size
]

{ #category : #putting }
WABulkReapingCache >> store: anObject [
	| candidateKey value |
	value := WABulkReapingCacheEntry value: anObject.
	[ 
		| written |
		written := false.
		candidateKey := WAKeyGenerator current keyOfLength: self keySize.
		dictionary at: candidateKey ifAbsentPut: [ written := true. value ].
		written ] whileFalse.
	^ candidateKey
]
