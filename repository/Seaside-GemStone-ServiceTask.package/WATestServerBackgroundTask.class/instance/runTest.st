tests
runTest
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