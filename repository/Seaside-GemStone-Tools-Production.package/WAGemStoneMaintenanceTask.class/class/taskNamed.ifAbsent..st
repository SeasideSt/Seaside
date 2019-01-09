operations
taskNamed: aString ifAbsent: absentBlock

	self tasks do: [:task | task name = aString ifTrue: [ ^task ]].
	^absentBlock value