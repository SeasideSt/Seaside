rendering
renderContentOn: html
	html div
		class: 'tool';
		with: [
			html render: self table.
			html anchor
				callback: [ self resetDeprecationWarnings ];
				with: 'Reset deprecation warnings' ]
	