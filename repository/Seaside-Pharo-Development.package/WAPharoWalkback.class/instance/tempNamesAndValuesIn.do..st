private
tempNamesAndValuesIn: aContext do: aTwoArgumentBlock
	aContext tempScopedNames keysAndValuesDo: [ :index :each |
		aTwoArgumentBlock
			value: each
			value: (aContext tempAt: index) ]