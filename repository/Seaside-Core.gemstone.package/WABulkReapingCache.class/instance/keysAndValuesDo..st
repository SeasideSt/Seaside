enumerating
keysAndValuesDo: aTwoArgumentBlock
	dictionary keysAndValuesDo: [ :key :value |
		 aTwoArgumentBlock value: key value: value value ]