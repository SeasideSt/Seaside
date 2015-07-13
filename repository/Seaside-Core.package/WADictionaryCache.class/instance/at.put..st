putting
at: aKey put: anObject
	byValue at: anObject ifPresent: [ :key |
		key = aKey ifFalse: [
			self errorAlreadyMapped ] ].
	byKey at: aKey ifPresent: [ :value |
		byValue removeKey: value ].
	byKey at: aKey put: anObject.
	byValue at: anObject put: aKey.
	^ anObject