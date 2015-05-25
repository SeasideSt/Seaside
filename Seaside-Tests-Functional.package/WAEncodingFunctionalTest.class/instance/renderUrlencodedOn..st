rendering
renderUrlencodedOn: html

	html heading level2;
		with: 'Urlencoded'.
	html heading level3;
		with: self urlencoded.
	self renderCharacterByCharacter: self urlencoded on: html.
	html form: [
		html div: [
			html textInput
				on: #urlencoded of: self.
			html submitButton
				text: self urlencoded ] ].
	self renderClassName: self urlencoded on: html