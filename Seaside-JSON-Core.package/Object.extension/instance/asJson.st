*seaside-json-core
asJson
	^ WAJsonCanvas builder render: [ :json |
		self jsonOn: json ]