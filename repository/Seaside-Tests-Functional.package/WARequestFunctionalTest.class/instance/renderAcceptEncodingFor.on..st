rendering
renderAcceptEncodingFor: aRequest on: html
	html definitionTerm: 'Accept-Encoding:'.
	self renderQualifiedValues: aRequest acceptEncoding on: html