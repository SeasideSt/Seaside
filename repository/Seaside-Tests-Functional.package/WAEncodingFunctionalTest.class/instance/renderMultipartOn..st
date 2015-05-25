rendering
renderMultipartOn: html

	html heading level2;
		with: 'Multipart'.
	html heading level3;
		with: self multipart.
	self renderCharacterByCharacter: self multipart on: html.
	html form
		multipart;
		with: [
			html div: [
				html textInput
					on: #multipart of: self.
				html submitButton
					text: self multipart ] ].
	self renderClassName: self multipart on: html