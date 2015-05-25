configuration
createHandlers
	^ Array with: (WARegistry new
		 cache: WAPredictableCache new;
		yourself)