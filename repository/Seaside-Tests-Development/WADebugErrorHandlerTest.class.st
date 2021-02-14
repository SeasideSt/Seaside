"
This isn't really a unit test of WADebugErrorHandler but rather a test that tries to replicate a simple version of the same error handling behaviour upon which the error handler depends. The error handler itself would be hard to test because it opens a debugger as its first action.

This should at least help confirm that the assumptions that were in place when writing the handler on Squeak hold true on other platforms.
"
Class {
	#name : #WADebugErrorHandlerTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Development'
}

{ #category : #private }
WADebugErrorHandlerTest >> handleException: anException debuggerSimulation: debugBlock [
	debugBlock value.
	anException resume
]

{ #category : #private }
WADebugErrorHandlerTest >> simulateWithDebugBlock: debugBlock progress: desiredProgress result: desiredResult [ 
	"Set up a known working mechanism similar to the error handler so we can
	test whether the underlying system works the same way as on Squeak
	where WADebugErrorHandler was originally developed."
	| progress semaphore result |
	progress := OrderedCollection new.
	semaphore := GRPlatform current semaphoreClass new.
	
	[ 
	[ result := 
	[ progress add: #a.
	1 / 0.
	progress add: #b.
	#resumed ] 
		on: Error
		do: 
			[ :e | 
			progress add: #c.
			self 
				handleException: e
				debuggerSimulation: 
					[ progress add: #d.
					debugBlock value.
					progress add: #e ] ] ] ensure: [ semaphore signal ] ] fork.
	semaphore wait.
	self assert: progress asArray = desiredProgress asArray.
	self assert: result = desiredResult
]

{ #category : #tests }
WADebugErrorHandlerTest >> testMechanismAbort [
	"Test if things behave as expected when simulating a Debugger being closed
	(in other words, the process being terminated)."

	self
		simulateWithDebugBlock: [ Processor activeProcess terminate ]
		progress: #(#a #c #d)
		result: nil
]

{ #category : #tests }
WADebugErrorHandlerTest >> testMechanismProceed [
	"Test if things behave as expected when simulating a Debugger being proceeded
	(in other words, the process being terminated)."

	self
		simulateWithDebugBlock: [ nil ]
		progress: #(#a #c #d #e #b)
		result: #resumed
]
