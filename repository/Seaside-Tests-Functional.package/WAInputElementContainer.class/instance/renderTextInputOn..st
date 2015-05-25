rendering-elements
renderTextInputOn: html
	self
		renderLabel: 'Text Input'
		input: [
			html textInput
				value: textInput;
				callback: [ :value | textInput := value ] ]
		output: textInput printString
		on: html