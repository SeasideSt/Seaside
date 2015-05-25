tests-insertion
testInsertionShort
	| element |
	element := self insertion top: 'foo'.
	self assert: element equals: 'new Insertion.Top(this,"foo")'.

	element := self insertion id: 'bar'; bottom: 'foo'.
	self assert: element equals: 'new Insertion.Bottom("bar","foo")'.

	element := self insertion before: 'foo'.
	self assert: element equals: 'new Insertion.Before(this,"foo")'.

	element := self insertion id: 'bar'; after: 'foo'.
	self assert: element equals: 'new Insertion.After("bar","foo")'