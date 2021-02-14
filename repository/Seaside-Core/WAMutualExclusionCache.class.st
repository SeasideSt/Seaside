"
WAMutualExclusionCacheNG is a wrapper around a WACacheNG that wraps all messages in a mutex.

Instance Variables:
	mutex	<WAMutex>
	cache	<WACache>
"
Class {
	#name : #WAMutualExclusionCache,
	#superclass : #WACache,
	#instVars : [
		'mutex',
		'cache'
	],
	#category : 'Seaside-Core-Cache'
}

{ #category : #'instance creation' }
WAMutualExclusionCache class >> on: aCache [
	^ self basicNew initializeOn: aCache; yourself
]

{ #category : #accessing }
WAMutualExclusionCache >> at: aKey ifAbsent: aBlock [
	^ mutex critical: [
		cache at: aKey ifAbsent: aBlock ]	
]

{ #category : #putting }
WAMutualExclusionCache >> at: aKey put: anObject [
	^ mutex critical: [
		cache at: aKey put: anObject ]	
]

{ #category : #public }
WAMutualExclusionCache >> clear [
	^ mutex critical: [
		cache clear ]	
]

{ #category : #initialization }
WAMutualExclusionCache >> initializeOn: aCache [
	self initialize.
	mutex := WAMutex new.
	cache := aCache
]

{ #category : #accessing }
WAMutualExclusionCache >> keyAtValue: anObject ifAbsent: aBlock [
	^ mutex critical: [
		cache keyAtValue: anObject ifAbsent: aBlock ]	
]

{ #category : #accessing }
WAMutualExclusionCache >> keySize [
	^ mutex critical: [
		cache keySize ]	
]

{ #category : #enumerating }
WAMutualExclusionCache >> keysAndValuesDo: aTwoArgumentBlock [
	^ mutex critical: [
		cache keysAndValuesDo: aTwoArgumentBlock ]	
]

{ #category : #copying }
WAMutualExclusionCache >> postCopy [
	super postCopy.
	mutex := WAMutex new.
	cache := cache copy
]

{ #category : #removing }
WAMutualExclusionCache >> remove: anObject [
	^ mutex critical: [
		cache remove: anObject ]	
]

{ #category : #removing }
WAMutualExclusionCache >> removeKey: aKey [
	^ mutex critical: [
		cache removeKey: aKey ]	
]

{ #category : #accessing }
WAMutualExclusionCache >> size [
	^ mutex critical: [
		cache size ]	
]

{ #category : #putting }
WAMutualExclusionCache >> store: anObject [
	^ mutex critical: [
		cache store: anObject ]	
]

{ #category : #accessing }
WAMutualExclusionCache >> underlyingCache [
	^ cache
]
