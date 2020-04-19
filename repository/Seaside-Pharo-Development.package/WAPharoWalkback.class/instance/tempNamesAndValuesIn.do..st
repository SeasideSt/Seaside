private
tempNamesAndValuesIn: aContext do: aTwoArgumentBlock
	SystemVersion current major >= 8 ifTrue:[
		aContext tempNames doWithIndex: [ :each :index |
			aTwoArgumentBlock
				value: each
				value: (aContext namedTempAt: index) ] ]