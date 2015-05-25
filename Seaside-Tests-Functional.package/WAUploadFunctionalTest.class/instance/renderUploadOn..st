rendering
renderUploadOn: html

	html form
		multipart;
		with: [
			html div: [
				"div for HTML validation"
				html fileUpload callback: [ :f | file := f ].
				html submitButton text: 'Load' ] ]