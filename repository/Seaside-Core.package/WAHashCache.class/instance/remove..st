removing
remove: anObject
	| key |
	self sweepIncrementally.
	key := self keyAtValue: anObject ifAbsent: [ ^ anObject ].
	self removeKey: key