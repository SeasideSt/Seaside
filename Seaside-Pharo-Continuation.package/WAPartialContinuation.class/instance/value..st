evaluating
value: anObject
	"Evaluate the receiving partial continuation. Note tha partial continuations can be evaluated without a marker, in this case they are just spliced at the end of the current stack and resume return back to the sender."

	| marker |
	marker := WAMarkerRequest signal.
	marker isNil
		ifTrue: [ marker := thisContext sender ]
		ifFalse: [ self unwindFrom: thisContext to: marker ].
	self restoreValues swapSender: marker.
	thisContext swapSender: values first.
	^ anObject