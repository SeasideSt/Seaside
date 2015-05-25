tests
testConfirm
	self
		assert: (self mock confirm: 'Sure?')
		equals: 'if(confirm("Sure?")){mock}'