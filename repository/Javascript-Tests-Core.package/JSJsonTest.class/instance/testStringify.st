tests
testStringify
	self 
		assert: (self json stringify: self mock)
		equals: 'JSON.stringify(mock)'.
	self 
		assert: (self json stringify: self mock space: 4)
		equals: 'JSON.stringify(mock,4)'.
	self 
		assert: (self json stringify: self mock replacer: #())
		equals: 'JSON.stringify(mock,[])'.
	self 
		assert: (self json stringify: self mock replacer: #() space: ' ')
		equals: 'JSON.stringify(mock,[]," ")'