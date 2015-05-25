load and test
showUndeclared

	| newUndeclared |
	doTests ifFalse: [^self].
	newUndeclared := Undeclared keys.
	baseUndeclared do: [:each | newUndeclared remove: each].
	newUndeclared isEmpty ifTrue: [^self].
	Transcript cr; tab; show: 'Undeclared: ' , newUndeclared asSortedCollection asArray printString.
	