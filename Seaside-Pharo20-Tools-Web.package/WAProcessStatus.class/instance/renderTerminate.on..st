rendering
renderTerminate: aProcess on: html
	html anchor
		callback: [ aProcess terminate ];
		with: 'terminate'