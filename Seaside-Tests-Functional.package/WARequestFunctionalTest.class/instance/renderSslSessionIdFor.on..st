rendering
renderSslSessionIdFor: aRequest on: html
	aRequest isSsl ifTrue: [
		html definitionTerm: 'SSL Session Id:'.
		html definitionData: aRequest sslSessionId ]