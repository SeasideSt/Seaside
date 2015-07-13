description
describeOn: config
	(config classBindingCollection: #libraries)
		options: [ self libraryClasses ].
	(config classBinding: #initialContinuationClass)
		beAdvanced;
		options: [ self continuationClasses ];
		default: WANullSessionContinuation.
	(config string: #mimeType)
		beAdvanced;
		label: 'MIME Type';
		comment: 'The media type of HTML documents reported to the browser.';
		default: 'text/html'.
	(config url: #resourceBaseUrl)
		group: #server;
		comment: 'Sets the base URL for URLS generated with #resourceUrl:'.
	(config boolean: #sessionAllowTermination)
		comment: 'Whether sessions allows a special HTTP request to terminate the process currently running in the session. This is used during development and should be disabled for deployment.';
		default: false.
	(config classBinding: #sessionClass)
		comment: 'Sessions in this application will be instances of this class.';
		options: [ self sessionClasses ];
		default: WASession.
	(config listOfClasses: #trackingStrategy)
		comment: 'How sessions and document handlers should be tracked.';
		options: [ self trackingStrategyClasses ];
		default: WAQueryFieldHandlerTrackingStrategy new
