json api
getMethodsOf: className

	<get>
	<path: '/class/{className}/methods'>
	<produces: 'application/json'>
	
	| theClass |
	theClass := Smalltalk at: className asSymbol ifAbsent: [ self respondNotFound ].

	^ WAJsonCanvas builder render: [ :json |
		json array: [
			theClass methodsDo: [ :method |
					json object: [
						json
							key: 'selector' value: method selector;
							key: 'source' value: (GRPlatform current sourceCodeStringOf: method) ] ] ] ]