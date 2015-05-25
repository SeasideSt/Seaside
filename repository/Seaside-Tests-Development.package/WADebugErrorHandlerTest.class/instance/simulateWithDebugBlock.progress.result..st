private
simulateWithDebugBlock: debugBlock progress: desiredProgress result: desiredResult 
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