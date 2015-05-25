rendering
renderContentOn: html
	html form: [
		html text: 'You are about to create your first component in this Smalltalk image, please enter your name to associate it with your code:'.
		html textInput
			on: #authorName of: self.
		html submitButton
			text: 'OK';
			callback: [ self handleAuthorNameSubmission ] ]