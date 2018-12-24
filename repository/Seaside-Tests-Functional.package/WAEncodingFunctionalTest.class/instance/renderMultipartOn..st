rendering
renderMultipartOn: html

	html heading level2;
		with: 'Multipart'.
	html heading level3;
		id: #multipartheading;
		with: self multipart.
	self renderCharacterByCharacter: self multipart on: html.
	html form
		multipart;
		id: #multipartform;
		with: [
			html div: [
				html textInput
					on: #multipart of: self.
				html submitButton
					text: self multipart ] ].
	self renderClassName: self multipart on: html