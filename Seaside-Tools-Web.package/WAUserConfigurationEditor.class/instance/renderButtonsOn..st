rendering
renderButtonsOn: html
	html paragraph: [
		dialog 
			ifTrue: [ html submitButton on: #ok of: self ].
		html submitButton on: #apply of: self.
		html cancelButton on: #cancel of: self ]