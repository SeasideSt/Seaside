tests-options
testUsername
	self
		assert: (self ajax username: 'seaside')
		equals: self function , '.ajax({"username":"seaside"})'