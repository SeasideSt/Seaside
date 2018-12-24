rendering
renderLoadFromFileOn: html
	html heading level2; with: 'Load version from file'.
	html form
		multipart;
		with: [
		 	html div: [
				html fileUpload
					callback: [ :f | file := f ].
				html space.
				html submitButton
					callback: [ self loadFile ];
					text: 'Load' ] ]