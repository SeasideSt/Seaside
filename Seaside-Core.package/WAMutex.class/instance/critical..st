mutual exclusion
critical: aBlock
	| process |
	process := Processor activeProcess.
	^ (owner == process)
		ifTrue: [ aBlock value ]
		ifFalse: [
			semaphore critical: [
				owner := process.
				aBlock ensure: [ owner := nil ] ] ]