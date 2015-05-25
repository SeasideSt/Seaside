*seaside-json-core
jsonOn: aRenderer
	aRenderer object: [
		self keysAndValuesDo: [ :key :value |
			aRenderer key: key value: value ] ]