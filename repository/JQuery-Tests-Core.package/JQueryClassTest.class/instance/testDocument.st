tests-creation
testDocument
	self
		assert: (self jQuery document)
		equals: self function , '(document)'