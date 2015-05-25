tests-accessing
testUrl
	self 
		assert: self ajax url
		equals: '"/"'.
	self
		assert: (self ajax callback: [ ]; url)
		equals: '"http://www.seaside.st/"'.
	self
		assert: (self ajax callback: [ ] value: $a; url)
		equals: '"http://www.seaside.st/"'.
	self
		assert: (self ajax callback: [ ] value: self mock; url)
		equals: '"http://www.seaside.st/"'