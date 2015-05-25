tests-form
testFormEnumerating
	self
		assertEnumerable: [ self form elements ]
		prefix: '$(this).getElements()'.
	self
		assertEnumerable: [ self form inputs ]
		prefix: '$(this).getInputs()'