rendering
renderContentOn: html
	| url input |
	html form
		onSubmit: (html javascript return: false);
		with: [ 
			(input := html textInput)
				value: self serverUrl greaseString;
				callback: [ :urlString | url := WAUrl absolute: urlString ].
			self serverUrl isNil ifTrue: [ 
				"Setup a sample string"
				input
					value: 'http://localhost:8080/';
					class: 'sampleValue';
					script:
						(html jQuery this onFocus:
							((html jQuery this)
								value: '';
								removeClass: 'sampleValue';
								unbind: 'focus')) ].
			html button
				bePush;
				onClick:
					(((html jQuery: #confirm) load)
						html: '';
						serializeForm;
						html: [ :r | self renderTryingUrl: url on: r ]);
				with: 'Test' ].
	html div id: 'confirm'