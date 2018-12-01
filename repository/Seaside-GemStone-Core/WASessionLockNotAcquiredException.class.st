Class {
	#name : #WASessionLockNotAcquiredException,
	#superclass : #WARetryHttpRequest,
	#category : 'Seaside-GemStone-Core-Notifications'
}

{ #category : #logging }
WASessionLockNotAcquiredException >> logMessage [

	^'Lock not acquired - retrying'
]
