mutual exclusion
critical: aBlock
	| process |
	process := Processor activeProcess.
	^ (self owner == process)
		ifTrue: [ aBlock value ]
		ifFalse: [
			semaphore critical: [
				self owner: process.
				aBlock ensure: [ self owner: nil ] ] ]