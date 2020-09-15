*Seaside-Pharo70-JSON-Extensions
jsonOn: aRenderer
	aRenderer object: [
		self keysAndValuesDo: [ :key :value |
			aRenderer key: key value: value ] ]