operations
removeTaskNamed: aString

	| removals |
	removals := OrderedCollection new.
	self tasks do: [:task | task name = aString ifTrue: [ removals add: task ]].
	removals do: [: task | self tasks remove: task ].