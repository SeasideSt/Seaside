accessing
model
	^ CounterModel ifNil: [ CounterModel := WACounterModel new ]