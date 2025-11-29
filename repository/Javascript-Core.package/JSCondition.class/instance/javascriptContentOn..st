printing
javascriptContentOn: aRenderer

	(aRenderer function: 'if')
		with: [ 
			aRenderer render: self statement ].
	aRenderer document openBlock.
	super javascriptContentOn: aRenderer.
	aRenderer document closeBlock.