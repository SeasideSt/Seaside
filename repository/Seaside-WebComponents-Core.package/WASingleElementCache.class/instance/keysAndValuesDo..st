enumerating
keysAndValuesDo: aTwoArgumentBlock
	key isNil ifFalse: [
		aTwoArgumentBlock value: key value: value ]