handling
addExposedHeadersTo: aResponse

	self exposedHeaders ifNotEmpty: [ :exposed | 
		aResponse
			headerAt: 'Access-Control-Expose-Headers'
			put: (String streamContents: [ :str | 
					 exposed
						 do: [ :expose | str nextPutAll: expose ]
						 separatedBy: [ str nextPutAll: ', ' ] ]) ]