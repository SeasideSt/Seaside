converting
responseFrom: aRequestContext
	"Since the response knows how to write itself on the stream (and may already be partly written),
	there's not much left to do."
	
	aRequestContext response
		flush;
		close