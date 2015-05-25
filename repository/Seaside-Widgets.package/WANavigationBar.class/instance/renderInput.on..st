rendering
renderInput: aSymbol on: html
	html form: [
		html strong: aSymbol capitalized.
		html space.
		html textInput
			callback: [ :value |
				self target perform: aSymbol with: value ] ]