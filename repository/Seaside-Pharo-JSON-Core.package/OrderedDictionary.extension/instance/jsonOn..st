*Seaside-Pharo-JSON-Core
jsonOn: aRenderer
	aRenderer object: [
		self keysAndValuesDo: [ :key :value |
			aRenderer key: key value: value ] ]