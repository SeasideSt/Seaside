accessing
block: aZeroOrOneArgBlock
	block := aZeroOrOneArgBlock isNil
		ifFalse: [ aZeroOrOneArgBlock fixCallbackTemps ]