"
WACacheis the abstract base class for session and continuation stores in Seaside. The default implementation is WAHashCache.
"
Class {
	#name : #WACache,
	#superclass : #WAObject,
	#category : 'Seaside-Core-Cache'
}

{ #category : #accessing }
WACache >> at: aKey ifAbsent: aBlock [
	self subclassResponsibility
]

{ #category : #putting }
WACache >> at: aKey put: anObject [
	self subclassResponsibility
]

{ #category : #public }
WACache >> clear [
	self subclassResponsibility
]

{ #category : #accessing }
WACache >> keyAtValue: anObject ifAbsent: aBlock [
	self subclassResponsibility
]

{ #category : #accessing }
WACache >> keySize [
	^ 16
]

{ #category : #enumerating }
WACache >> keysAndValuesDo: aTwoArgumentBlock [
	self subclassResponsibility
]

{ #category : #removing }
WACache >> remove: anObject [
	self subclassResponsibility
]

{ #category : #accessing }
WACache >> size [
	self subclassResponsibility
]

{ #category : #putting }
WACache >> store: anObject [
	"Store anObject in the cache, generating a new random key. Return the key."
	self subclassResponsibility
]
