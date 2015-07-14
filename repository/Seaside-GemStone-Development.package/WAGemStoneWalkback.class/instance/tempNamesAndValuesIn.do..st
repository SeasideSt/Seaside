private
tempNamesAndValuesIn: aContext do: aTwoArgumentBlock
	"Evaluate aTwoArgumentBlock for every temp in aContext with the name of the temp and the current value. The code is supposed to work on Squeak and Pharo closure and non-closure images."

	| tempNames |
	tempNames := aContext tempNames.
	tempNames do: [ :each |
		aTwoArgumentBlock
			value: each
			value: (aContext tempAt: (tempNames indexOf: each)) ]