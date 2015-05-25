rendering
renderContentOn: html
	html form: [
		html text: 'Name your component: '.
		html textInput
			on: #componentName of: self.
		html submitButton
			text: 'Create';
			callback: [ self answer: self componentName capitalized asSymbol ] ]