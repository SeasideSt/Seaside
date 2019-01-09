operations
expunge
	next isNil ifFalse: [
		next previous: previous ].
	previous isNil ifFalse: [
		previous next: next ].
	next := nil.
	previous := nil