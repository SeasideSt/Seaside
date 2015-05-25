tests-insertion
testInsertion
	| element |
	element := self insertion top.
	self assert: element equals: 'Insertion.Top'.

	element := self insertion bottom.
	self assert: element equals: 'Insertion.Bottom'.

	element := self insertion before.
	self assert: element equals: 'Insertion.Before'.

	element := self insertion after.
	self assert: element equals: 'Insertion.After'