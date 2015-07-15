testing
isStopped
	^ server isNil or: [ server isRunning not ]