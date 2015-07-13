accessing
overflowActions
	^ Array
		with: self removeRelativeOldest
		with: self removeAbsoluteOldest
		with: self signalError