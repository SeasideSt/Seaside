Class {
	#name : #WATestServerBackgroundTask,
	#superclass : #Object,
	#instVars : [
		'backgroundTask'
	],
	#classInstVars : [
		'default'
	],
	#category : 'Seaside-GemStone-ServiceTask'
}

{ #category : #'Instance Creation' }
WATestServerBackgroundTask class >> default [
	^ default ifNil: [
		"enclosed in a transaction as later we abort the transaction repeatedly while we check to see 
		if the service gem has completed our task. Without a transaction the value might not be
		set as the abort will revert to it's prior unassigned state." 
		GRPlatform current doTransaction: [ default := self new ]. 
		default ]
]

{ #category : #'Instance Creation' }
WATestServerBackgroundTask class >> reset [
	default := nil
]

{ #category : #'Instance Creation' }
WATestServerBackgroundTask class >> runTest [
	| originalTransactionMode |
	originalTransactionMode := System transactionMode.
	
	"Need to set to manual transaction mode so that I can manually #commitTransaction and
	#abortTransaction. I #commitTransaction to update instance variable, and #abortTransaction to
	receive updates from the background service task.
	
	Note: I tried System #continueTransaction (see GS64-ProgGuide-2.4.pdf p.137), instead of 
	#abortTransaction, but that didn't appear to work."
	^ [
		System transactionMode: #manualBegin.
		self default runTest
	] ensure: [ 
		System transactionMode: originalTransactionMode]
]

{ #category : #support }
WATestServerBackgroundTask >> backgroundTask [
	^ backgroundTask
]

{ #category : #tests }
WATestServerBackgroundTask >> runTest [
	"don't run this directly; instead execute from class side #runTest, that is execute:
	WATestServerBackgroundTask runTest"
	| totalWait |
	totalWait := 0.

	self startBackgroundTask.
	
	"wait for a maximum of 5s for a result,
	here we are blocking to wait a result from a backgroundTask, however normally
	you'd fire off a background task and forget it"
	[totalWait < 5000 and: [(self backgroundTask hasValue or: [ self backgroundTask hasError ]) not]] whileTrue: [
		System _sleepMs: 100. 
		totalWait := totalWait + 100.
		
		"#doAbortTransaction ensures that the background task is updated when it has been
		processed by the service gem.
		In a Seaside application you don't have to worry about this as an abort occurs at the start
		of each request processing cycle. In normal use fire of a set of serverBackgroundTask in a
		callback. Then if you want to check to see if a background task hascompleted call #hasValue
		on the serverBackgroundTask"
		GRPlatform current doAbortTransaction].
	
	"rethrow exception here" 
	self backgroundTask exception ifNotNil: [ self backgroundTask exception pass ].
	
	^ self backgroundTask hasValue 
		ifTrue: [ self backgroundTask value ]
		ifFalse: [ 'there has been a problem processing the background task' ]
]

{ #category : #support }
WATestServerBackgroundTask >> startBackgroundTask [
	"enclosed in a transaction as later we abort the transaction repeatedly while we check to see 
	if the service gem has completed our task. Without a transaction the value might not be
	set as the abort will revert to it's prior unassigned state." 
	GRPlatform current doTransaction: [
		backgroundTask := [ 
			| timeInLondon |
			"should extact the time from the html; not the most robust parsing algorithmn"
			timeInLondon := (HTTPSocket httpGet: 'http://www.time.org/zones/Europe/London.php') throughAll:  'Europe/London - '; upTo: Character space.
			'(from http://www.time.org), time in London is: ', timeInLondon ] serverBackgroundTask ].
]
