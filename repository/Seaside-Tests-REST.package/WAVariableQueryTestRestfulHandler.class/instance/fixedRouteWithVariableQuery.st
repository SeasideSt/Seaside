as yet unclassified
fixedRouteWithVariableQuery
	<path: 'fixedRouteWithVariableQuery?from={from}&to={to}&limit={limit}'>
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