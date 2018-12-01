Class {
	#name : #WAGsMutualExclusionFilter,
	#superclass : #WARequestFilter,
	#category : 'Seaside-GemStone-Session-Filter'
}

{ #category : #processing }
WAGsMutualExclusionFilter >> handleFiltered: aRequestContext [
	"acquire a lock on the receiver to prevent two separate gems from processing requests for the
	 same session at the same time"
	
	| result |
	result := System _lock: self  kind: 3  autoRelease: true.
	(result ~~ 1)
		ifTrue: [ 
			"lock denied - presumably the request will be retried"
			^WASessionLockNotAcquiredException signal: 'Session lock denied: ', result printString ].
	^super handleFiltered: aRequestContext
]
