rendering
renderContentOn: html
	html form
		defaultAction: [ self answer: value ];
		with: [
			html div: [
				html textInput on: #value of: self.
				html space.
				html submitButton
					callback: [ self answer: value ];
					text: self label ] ]