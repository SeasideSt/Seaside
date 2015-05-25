accessing
currentTiming
	"Answer the running timing, or 0 if no value is available."

	^ startTime isNil ifTrue: [ 0 ] ifFalse: [ Time millisecondsSince: startTime ]