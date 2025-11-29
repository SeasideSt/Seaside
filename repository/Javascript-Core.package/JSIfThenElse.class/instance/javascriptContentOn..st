printing
javascriptContentOn: aRenderer
	aRenderer document nextPut: $(.
	super javascriptContentOn: aRenderer.
	aRenderer document nextPut: $?.
	aRenderer render: self trueStatement.
	aRenderer document nextPut: $:.
	aRenderer render: self falseStatement.
	aRenderer document nextPut: $)