rendering
renderGetOn: html

	html heading level2;
		with: 'GET'.
	html heading level3;
		id: #getheading;
		with: self get.
	self renderCharacterByCharacter: self get on: html.
	html form
		get;
		id: #getform;
		with: [
			html div: [
				html textInput
					on: #get of: self.
				html submitButton
					text: self get ] ].
	self renderClassName: self get on: html