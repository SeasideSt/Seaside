handling
addAllowedHeadersTo: aResponse

	self allowedHeaders ifNotEmpty: [ :allowed | 
		aResponse
			headerAt: 'Access-Control-Allow-Headers'
			put: (String streamContents: [ :str | 
					 allowed
						 do: [ :allow | str nextPutAll: allow ]
						 separatedBy: [ str nextPutAll: ', ' ] ]) ]