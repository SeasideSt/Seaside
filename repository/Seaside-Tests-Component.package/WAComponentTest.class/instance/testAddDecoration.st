tests
testAddDecoration
	self assert: (root addDecoration: decoration1) = decoration1.
	self assert: (root decorations size = 1).
	self assert: (root decorations first = decoration1).
	
	self assert: (root addDecoration: decoration2) = decoration2.
	self assert: (root decorations size = 2).
	self assert: (root decorations first = decoration2).
	self assert: (root decorations last = decoration1)