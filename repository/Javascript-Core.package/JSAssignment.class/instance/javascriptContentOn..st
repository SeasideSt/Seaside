printing
javascriptContentOn: aRenderer
	super javascriptContentOn: aRenderer.
	aRenderer assignment: [ 
		aRenderer render: self object ]