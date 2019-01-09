private
isWaitingOnSemaphore: aProcess
	"answers whether the given Process is waiting on a semaphore"

	^ aProcess suspendingList isKindOf: Semaphore