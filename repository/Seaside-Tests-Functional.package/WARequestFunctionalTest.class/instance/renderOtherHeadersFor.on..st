rendering
renderOtherHeadersFor: aRequest on: html
	aRequest headers keys sorted do: [ :each |
		(#('accept-charset' 'accept-encoding' 'accept' 'accept-language' 'cookie' '') includes: each) ifFalse: [
			html definitionTerm: each, ':'.
			html definitionData: (aRequest headerAt: each) ] ]