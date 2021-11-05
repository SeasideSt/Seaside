testing
isPreflight: aRequest

	^ aRequest method = 'OPTIONS' and: [ self isCORS: aRequest ]