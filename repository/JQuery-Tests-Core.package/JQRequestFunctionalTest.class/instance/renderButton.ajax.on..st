rendering
renderButton: aString ajax: anAjax on: html
	html button
		bePush;
		onClick: (html jQuery script: [ :s |
			self clearLoggerOn: s.
			s << (anAjax
				serializeForm;
				onSuccess: ((html jQuery: #logger)
					append: 'Request Success');
				done: ((html jQuery: #logger)
					append: ' | done');
				fail: ((html jQuery: #logger)
					append: ' | fail (unexpected)');
				always: ((html jQuery: #logger)
					append: ' | always');
				script: [ :inner | self loggerOn: inner ]) ]);
		with: aString