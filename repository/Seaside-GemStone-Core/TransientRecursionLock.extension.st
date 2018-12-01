Extension { #name : #TransientRecursionLock }

{ #category : #'*seaside-gemstone-core' }
TransientRecursionLock >> privateLockingProcess: aProcess [
	"This method is private to the Seaside core implementation. 
	
	It exists only because Seaside's call/answer implementation in Gemstone manipulates processes, eventually leading to a change in the reified process object for the process, even though the process itself is the same. In such a case, when a recursive entry is made to critical section protected by the lock, the entry will be blocked (because the Process instance in the lockingProcess instvar is no longer the same as the reified Process instance for the active process) and a deadlock occurs. See more info at https://github.com/GsDevKit/Seaside31/issues/71"
	lockingProcess := aProcess
]
