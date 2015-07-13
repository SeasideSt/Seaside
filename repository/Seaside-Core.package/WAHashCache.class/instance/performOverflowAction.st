private
performOverflowAction
	overflowAction == self class signalError ifTrue: [
		WAMaximumNumberOfSessionsExceededError signal ].
	overflowAction == self class removeAbsoluteOldest ifTrue: [
		self removeCacheEntry: byCreationStart cacheEntry ].
	overflowAction == self class removeRelativeOldest ifTrue: [
		self removeCacheEntry: byAccessStart cacheEntry ]