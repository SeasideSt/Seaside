*Javascript-Pharo-Core
javascriptOn: aRenderer
	aRenderer object: [
		self keysAndValuesDo: [ :key :value |
			aRenderer key: key value: value ] ]