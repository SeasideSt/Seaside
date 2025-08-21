printing
javascriptContentOn: aRenderer

	aRenderer render: self owner.
	aRenderer document dotProperty: self method.
	aRenderer arguments: [
		self argumentsDo: [ :each |
			 aRenderer argument: each ] ]