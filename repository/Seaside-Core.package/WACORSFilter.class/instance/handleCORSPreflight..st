handling
handleCORSPreflight: aRequestContext

	| response |
	response := aRequestContext response.
	self addCORSHeadersTo: response.
	aRequestContext respond