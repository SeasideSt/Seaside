Class {
	#name : #WAObjectLogEntry,
	#superclass : #RemoteDebuggerLogEntry,
	#instVars : [
		'request'
	],
	#category : 'Seaside-GemStone-Core'
}

{ #category : #'instance creation' }
WAObjectLogEntry class >> debug: aString request: aWARequest object: anObject [

	^(self debug: aString object: anObject)
		request: aWARequest;
		yourself
]

{ #category : #'instance creation' }
WAObjectLogEntry class >> error: aString request: aWARequest continuation: aGsProcess [

	^(self error: aString continuation: aGsProcess)
		request: aWARequest;
		yourself
]

{ #category : #'instance creation' }
WAObjectLogEntry class >> error: aString request: aWARequest object: anObject [

	^(self error: aString object: anObject)
		request: aWARequest;
		yourself
]

{ #category : #'instance creation' }
WAObjectLogEntry class >> fatal: aString request: aWARequest object: anObject [

	^(self fatal: aString object: anObject)
		request: aWARequest;
		yourself
]

{ #category : #'instance creation' }
WAObjectLogEntry class >> info: aString request: aWARequest object: anObject [

	^(self info: aString object: anObject)
		request: aWARequest;
		yourself
]

{ #category : #'instance creation' }
WAObjectLogEntry class >> trace: aString request: aWARequest object: anObject [

	^(self trace: aString object: anObject)
		request: aWARequest;
		yourself
]

{ #category : #'instance creation' }
WAObjectLogEntry class >> transcript: aString request: aWARequest object: anObject [

	^(self transcript: aString object: anObject)
		request: aWARequest;
		yourself
]

{ #category : #'instance creation' }
WAObjectLogEntry class >> warn: aString request: aWARequest object: anObject [

	^(self warn: aString object: anObject)
		request: aWARequest;
		yourself
]

{ #category : #testing }
WAObjectLogEntry >> isResumable [
	"disable resume for continuations until bugs relating to resuming are fixed.
	 Issue 128: http://code.google.com/p/glassdb/issues/detail?id=128"
	
	^false
]

{ #category : #accessing }
WAObjectLogEntry >> request [

	^request
]

{ #category : #accessing }
WAObjectLogEntry >> request: aWARequest [

	request := aWARequest
]

{ #category : #accessing }
WAObjectLogEntry >> requestString [

	self request == nil ifTrue: [ ^super requestString ].
	^self request url asString
]
