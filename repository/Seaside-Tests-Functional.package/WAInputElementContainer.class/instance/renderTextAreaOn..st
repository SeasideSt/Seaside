rendering-elements
renderTextAreaOn: html
	self
		renderLabel: 'Text Area'
		input: [
			html textArea
				rows: 3;
				columns: 17;
				value: textArea;
				callback: [ :value | textArea := value ] ]
		output: textArea printString
		on: html