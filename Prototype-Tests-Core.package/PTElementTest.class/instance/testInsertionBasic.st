tests-insertion
testInsertionBasic
	| element |
	element := self insertion top; with: 'foo'.
	self assert: element equals: 'new Insertion.Top(this,"foo")'.

	element := self insertion bottom; id: 'bar'; with: 'foo'.
	self assert: element equals: 'new Insertion.Bottom("bar","foo")'.

	element := self insertion before; with: 'foo'.
	self assert: element equals: 'new Insertion.Before(this,"foo")'.

	element := self insertion after; id: 'bar'; with: 'foo'.
	self assert: element equals: 'new Insertion.After("bar","foo")'