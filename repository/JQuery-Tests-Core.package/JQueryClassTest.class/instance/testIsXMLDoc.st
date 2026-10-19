tests-utilities
testIsXMLDoc
	self
		assert: (self jQuery isXMLDoc: Dictionary new)
		equals: self function , '.isXMLDoc({})'