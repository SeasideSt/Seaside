utilities
javascriptOn: aRenderer
	"Need to render the renderable as a Javascript string with embedded html"
	aRenderer document stream nextPut: $".
		WAHtmlCanvas builder
			actionUrl: aRenderer context actionUrl;
			resourceUrl: aRenderer context resourceUrl;
			render: renderable
			on: (GRPlatform current javascriptEncoderOn: aRenderer context document stream).
	aRenderer document stream nextPut: $".