Class {
	#name : #WABulkReapingCacheTest,
	#superclass : #WAExpiringCacheTest,
	#category : 'Seaside-Tests-Core-Cache'
}

{ #category : #running }
WABulkReapingCacheTest >> createCache [
	^ WABulkReapingCache
		initialSize: 13
		maximumSize: 0
		maximumAbsoluteAge: 0
		maximumRelativeAge: 0
		overflowAction: WAHashCache signalError
]

{ #category : #testing }
WABulkReapingCacheTest >> testExpireAbsolute [
	"
	max age: 3 sec
	
	put 1
	wait 2 sec
	put 2
	wait 2 sec
	
	1 should be expired
	2 should not be expired"
	| delay absent |
	self workAroundPharo3Bug.
	
	cache := WABulkReapingCache
		initialSize: 13
		maximumSize: 10
		maximumAbsoluteAge: 3
		maximumRelativeAge: 0
		overflowAction: WAHashCache signalError.
	delay := Delay forSeconds: 2.
		
	cache at: 1 put: '1'.
	delay wait.
	cache at: 2 put: '2'.
	delay wait.
	self assert: cache reap = 1 description: 'should reap exactly one item'.
	
	"1 should be gone"
	absent := false.
	cache at: 1 ifAbsent: [ absent := true ].
	self assert: absent description: 'the oldest item should be gone'.
	
	"2 should still be there"
	self assert: (cache at: 2 ifAbsent: [ self assert: false ]) = '2' description: 'the newest item should not be gone'
]

{ #category : #testing }
WABulkReapingCacheTest >> testExpireRelative [
	"
	max age: 3 sec
	
	put 1
	put 2
	wait 2 sec
	access 1
	wait 2 sec
	
	1 should not be expired
	2 should be expired"
	| delay absent |
	self workAroundPharo3Bug.
	
	cache := WABulkReapingCache
		initialSize: 13
		maximumSize: 10
		maximumAbsoluteAge: 0
		maximumRelativeAge: 3
		overflowAction: WAHashCache signalError.
	delay := Delay forSeconds: 2.
		
	cache at: 1 put: '1'.
	cache at: 2 put: '2'.
	delay wait.	
	cache at: 1 ifAbsent: [ self assert: false ].
	delay wait.
	self assert: cache reap = 1 description: 'should reap exactly one item'.
	
	"1 should still be there"
	self assert: (cache at: 1 ifAbsent: [ self assert: false ]) = '1'.
	
	"2 should be gone"
	absent := false.
	cache at: 2 ifAbsent: [ absent := true ].
	self assert: absent
]

{ #category : #testing }
WABulkReapingCacheTest >> testInitialCount [
	| counter |
	self workAroundPharo3Bug.
	
	counter := GRPlatform current newReducedConflictCounter.
	self assert: counter value = 0.
	counter increment.
	self assert: counter value = 1
]

{ #category : #testing }
WABulkReapingCacheTest >> testSendUnregistered [
	"
	max age: 1 sec
	
	put 1
	wait 2 sec
	
	1 should be expired and have received #unregistered"
	| delay value absent |
	self workAroundPharo3Bug.
	
	cache := WABulkReapingCache
		initialSize: 13
		maximumSize: 10
		maximumAbsoluteAge: 1
		maximumRelativeAge: 0
		overflowAction: WAHashCache signalError.
	delay := Delay forSeconds: 2.
	
	value := WAObjectUnderstandingUnregistered new.
	self deny: value hasReceivedUnregistered.
	cache at: 1 put: value.
	delay wait.
	self assert: cache reap = 1 description: 'should reap exactly one item'.
	
	"1 should be gone"
	absent := false.
	cache at: 1 ifAbsent: [ absent := true ].
	self assert: absent.
	
	self assert: value hasReceivedUnregistered
]

{ #category : #private }
WABulkReapingCacheTest >> workAroundPharo3Bug [
	"apparently the first delay you execute in a Pharo 3 image gets ignored
	fixed in Pharo 4"
	(Delay forMilliseconds: 1) wait
]
