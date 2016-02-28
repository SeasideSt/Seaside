as yet unclassified
parameterRouteWithVariableQuery: pathParameter
	<path: 'parameterRouteWithVariableQuery/{pathParameter}'>
	<variableQuery: true>
	| request |
	request := self requestContext request.
	self requestContext
		respond: [ :response | 
			request url queryFields
				keysAndValuesDo: [ :key :value | 
					response
						nextPutAll: key;
						nextPut: $=;
						nextPutAll: value;
						nextPut: $& ] ]