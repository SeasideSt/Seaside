actions
signalSemaphore: aProcess
	(self isWaitingOnSemaphore: aProcess)
		ifFalse: [ ^ self ].
	"there is a potential race condition here because of check-then-act but we don't care about this"
	[ aProcess suspendingList signal ] fork