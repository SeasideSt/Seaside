testing
assertLibraryResponse: response
	self assert: (response contents
					indexOfSubCollection: self expectedLibraryContents
					startingAt: 1) > 0