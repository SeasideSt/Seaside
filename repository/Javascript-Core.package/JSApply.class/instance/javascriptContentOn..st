printing
javascriptContentOn: aRenderer
	super javascriptContentOn: aRenderer.
	aRenderer arguments: [ 
		self argumentsDo: [ :each |
			aRenderer argument: each ] ]