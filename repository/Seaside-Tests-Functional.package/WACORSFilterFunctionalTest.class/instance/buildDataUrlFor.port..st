accessing-urls
buildDataUrlFor: host port: port

	^self baseUrl
		 port: port;
		 addToPath: 'tests';
		 addToPath: 'corsData';
		 addToPath: 'entries';
		 yourself