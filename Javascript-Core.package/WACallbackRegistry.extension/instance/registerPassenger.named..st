*javascript-core
registerPassenger: anObject named: aString
	| callback |
	callback := JSPassenger new.
	callback setKey: aString callbacks: callbacks; setObject: anObject.
	callbacks at: (callback convertKey: aString) put: callback.
	^ aString