private
signalInterestingError
	GRPlatform current semaphoreClass forMutualExclusion critical: [
		WAError signal: 'foo' ]