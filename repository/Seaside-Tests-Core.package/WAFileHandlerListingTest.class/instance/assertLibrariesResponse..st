testing
assertLibrariesResponse: response
	self assert: (response contents 
					indexOfSubCollection: self expectedLibrariesContents 
					startingAt: 1) > 0