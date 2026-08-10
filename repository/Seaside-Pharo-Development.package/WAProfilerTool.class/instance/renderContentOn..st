rendering
renderContentOn: html
	html div class: 'tool'; with: self report.
	message isNil ifFalse: [
		html render: message ]