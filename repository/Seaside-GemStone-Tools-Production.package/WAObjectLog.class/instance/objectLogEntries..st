accessing
objectLogEntries: shouldLock

	shouldLock 
		ifTrue: [
			System writeLock: ObjectLogEntry objectQueue
				ifDenied: [ 
					WARetryHttpRequest signal: 'ObjectLogEntry objectQueue lock denied'.
					"does not return" ]
				ifChanged: [ 
					System addToCommitOrAbortReleaseLocksSet: ObjectLogEntry objectQueue.
					WARetryHttpRequest signal: 'ObjectLogEntry objectQueue lock dirty'.
					"does not return" ].
			System addToCommitOrAbortReleaseLocksSet: ObjectLogEntry objectQueue].
	^ObjectLogEntry objectLog