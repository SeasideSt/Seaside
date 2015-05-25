rendering
renderSignalSemaphore: aProcess on: html
	(self isWaitingOnSemaphore: aProcess) ifTrue: [
		html anchor
			callback: [ self signalSemaphore: aProcess ];
			with: 'signal semaphore' ]