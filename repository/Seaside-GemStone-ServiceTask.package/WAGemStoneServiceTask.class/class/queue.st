accessing
queue

	Queue == nil ifTrue: [ Queue := RcQueue new: 100 ].
	^Queue