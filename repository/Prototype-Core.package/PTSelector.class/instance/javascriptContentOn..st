printing
javascriptContentOn: aRenderer
	(aRenderer function: '$$')
		with: [
			self selectors do: [ :each |
				aRenderer argument: each ] ]