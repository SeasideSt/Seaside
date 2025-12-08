Class {
	#name : 'WASessionLockNotAcquiredException',
	#superclass : 'WARetryHttpRequest',
	#category : 'Seaside-GemStone-Core-Notifications',
	#package : 'Seaside-GemStone-Core',
	#tag : 'Notifications'
}

{ #category : 'logging' }
WASessionLockNotAcquiredException >> logMessage [

	^'Lock not acquired - retrying'
]
