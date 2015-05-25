rendering-elements
renderUploadOn: html
	self
		renderLabel: 'Upload'
		input: [ html fileUpload callback: [ :file | upload := file ] ]
		output: upload printString
		on: html