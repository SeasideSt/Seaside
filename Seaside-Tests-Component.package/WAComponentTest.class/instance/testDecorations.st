tests
testDecorations
	self assert: root decorations isEmpty.
	root show: child1.
	self assert: root decorations size = 1.
	root addDecoration: decoration1.
	self assert: root decorations size = 2
