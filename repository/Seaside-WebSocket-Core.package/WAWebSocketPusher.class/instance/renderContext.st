accessing-rendering
renderContext
	"Answer a fake rendering context for this pusher."

	^ WARenderContext new
		document: (WAHtmlDocument on: (WriteStream on: String new));
		actionUrl: WAUrl new;
		yourself