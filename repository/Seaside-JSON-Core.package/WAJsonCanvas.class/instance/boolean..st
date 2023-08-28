double-dispatch
boolean: aBoolean
	self document stream nextPutAll: (aBoolean ifTrue: [ 'true' ] ifFalse: [ 'false' ])