accessing
keyAtValue: anObject ifAbsent: aBlock
	| valueHash index entry |
	self sweepIncrementally.
	valueHash := anObject hash.
	index := (valueHash \\ valueTable size) + 1.
	entry := valueTable at: index.
	[ entry isNil ] whileFalse: [
		(entry valueHash = valueHash and: [ entry value = anObject ])
			ifTrue: [
				"update access time"
				self at: entry key ifAbsent: [ self errorKeyNotFound ].
				^ entry key ]
			ifFalse: [ entry := entry next ] ].
	^ aBlock value