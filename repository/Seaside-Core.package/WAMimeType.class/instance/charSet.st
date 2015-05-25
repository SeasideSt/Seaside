parameters
charSet
	^ self parameters at: 'charset' ifAbsent: [ nil ]