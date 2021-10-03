headers
addAllowedMethodsHeadersTo: aResponse

	self allowedMethods ifNotEmpty: [ :allowed | 
		aResponse
			headerAt: 'Access-Control-Allow-Methods'
			put: (String streamContents: [ :str | 
					 allowed
						 do: [ :allow | str nextPutAll: allow ]
						 separatedBy: [ str nextPutAll: ', ' ] ]) ]