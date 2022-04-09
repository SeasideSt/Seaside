private
tempNamesAndValuesInPharo8Plus: aContext do: aTwoArgumentBlock

	aContext tempNames do: [ :each | 
		aTwoArgumentBlock value: each value: (aContext tempNamed: each) ]