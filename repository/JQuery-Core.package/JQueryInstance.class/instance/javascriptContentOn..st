printing
javascriptContentOn: aRenderer
	super javascriptContentOn: aRenderer.
	aRenderer arguments: [
		arguments do: [ :each |
			aRenderer argument: each ] ]