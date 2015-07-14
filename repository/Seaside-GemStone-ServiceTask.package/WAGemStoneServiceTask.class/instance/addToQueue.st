private
addToQueue
	self class queue add: self.
	self class incrementSharedCounterValue.