accessing
model
	^ model ifNil: [ model := CTCounterModel new ]