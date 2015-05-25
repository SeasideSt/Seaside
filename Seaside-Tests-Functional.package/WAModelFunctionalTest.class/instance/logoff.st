actions
logoff
	state := #OFF.
	test ifTrue: [ self inform: 'Logged off' onAnswer: [ ] ]