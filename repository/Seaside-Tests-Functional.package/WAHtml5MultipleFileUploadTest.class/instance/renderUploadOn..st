rendering
renderUploadOn: html

	html form
		multipart;
		with: [
			html div: [
				"div for HTML validation"
				html fileUpload
					multipleValuesCallback: [ :f | files := f ].
				html submitButton ] ]