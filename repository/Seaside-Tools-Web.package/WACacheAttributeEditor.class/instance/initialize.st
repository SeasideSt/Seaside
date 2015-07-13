initialization
initialize
	super initialize.
	overflowActionLabels := Dictionary new.
	overflowActionLabels at: WAHashCache removeAbsoluteOldest put: 'remove the oldest element'.
	overflowActionLabels at: WAHashCache removeRelativeOldest put: 'remove the element last accessed the longest time ago'.
	overflowActionLabels at: WAHashCache signalError put: 'signal an error'