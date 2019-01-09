accessing
sharedCounterValue

	^(System _sharedCounterFetchValuesFrom: self sharedCounterIndex to: self sharedCounterIndex) at: 1