rendering
renderButton: aString ajax: anAjax on: html
	html button
		bePush;
		onClick: (anAjax
			serializeForm;
			onSuccess: ((html jQuery: #logger)
				append: 'Request Success');
			script: [ :s | self loggerOn: s ]);
		with: aString