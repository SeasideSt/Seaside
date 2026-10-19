rendering
renderFailButtonOn: html
	html button
		bePush;
		onClick: (html jQuery script: [ :s |
			self clearLoggerOn: s.
			s << ((html jQuery ajax)
				serializeForm;
				"Override the functional test page's default error callback so the deferred fail path stays visible."
				onError: '';
				respond: [ :response |
					"Keep later script-based demo buttons from replaying stale server-side log entries."
					self resetLogger.
					response preconditionFailed ];
				done: ((html jQuery: #logger)
					append: ' | done (unexpected)');
				fail: ((html jQuery: #logger)
					append: 'Request Failed | fail');
				always: ((html jQuery: #logger)
					append: ' | always')) ]);
		with: 'Failing Request'