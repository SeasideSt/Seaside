private
tempNamesAndValuesIn: aContext do: aTwoArgumentBlock

	aContext tempNames doWithIndex: [ :each :index | 
		aTwoArgumentBlock value: each value: (aContext namedTempAt: index) ]