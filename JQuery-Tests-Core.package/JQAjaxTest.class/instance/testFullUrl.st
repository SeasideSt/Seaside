tests-accessing
testFullUrl
	self 
		assert: (self ajax fullUrl)
		equals: '"/"'.
	self
		assert: (self ajax callback: [ ]; fullUrl)
		equals: '"http://www.seaside.st/?_s=1&_k=a&1"'.
	self
		assert: (self ajax callback: [ ] value: $a; fullUrl)
		equals: '"http://www.seaside.st/?_s=1&_k=a&1&2=a"'.
	self
		assert: (self ajax callback: [ ] value: self mock; fullUrl)
		equals: '"http://www.seaside.st/?_s=1&_k=a&1"'