accessing-urls
buildDataUrlFor: host crossOrigin: crossOrigin

	| port |
	port := crossOrigin
		        ifTrue: [ WACORSResourceExample corsAdaptorPort ]
		        ifFalse: [WACORSResourceExample originAdaptorPort ].
	^self baseUrl
		 port: port;
		 addToPath: 'tests';
		 addToPath: 'corsData';
		 addToPath: 'entries';
		 yourself