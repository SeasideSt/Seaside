tests
testRemoveDecoration
	root addDecoration: decoration1; addDecoration: decoration2.
	self assert: (root removeDecoration: decoration2) = decoration2.
	self assert: (root decorations size = 1).
	self assert: (root decorations first = decoration1).
	
	root addDecoration: decoration2.
	self assert: (root removeDecoration: decoration1) = decoration1.
	self assert: (root decorations size = 1).
	self assert: (root decorations first = decoration2).
	
	self assert: (root removeDecoration: decoration1) isNil.
	self assert: (root decorations size = 1).
	self assert: (root decorations first = decoration2).

	self assert: (root removeDecoration: decoration2) = decoration2.
	self assert: (root decorations isEmpty).
		
	self assert: (root removeDecoration: decoration2) isNil