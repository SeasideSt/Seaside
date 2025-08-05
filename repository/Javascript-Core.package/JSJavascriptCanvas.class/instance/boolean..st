double-dispatch
boolean: aBoolean
	self document nextPutAll: (aBoolean ifTrue: [ 'true' ] ifFalse: [ 'false' ])