Extension { #name : 'Process' }

{ #category : '*Seaside-Pharo-Development' }
Process >> traverseWithMemory: aMemory seen: anIdentitySet [
	"Process is excluded because otherwise our Semaphores pull them in and the Process is
	obviously not held onto by the Semaphore indefinitely."
	anIdentitySet add: self
]
