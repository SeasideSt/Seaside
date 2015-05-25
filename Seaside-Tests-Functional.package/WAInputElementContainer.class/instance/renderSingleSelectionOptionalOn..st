rendering-elements
renderSingleSelectionOptionalOn: html
	self
		renderLabel: 'Single Selection (Optional)'
		input: [
			html select
				beOptional;
				list: self elements;
				optionalLabel: '(none)';
				selected: singleSelectionOptional;
				callback: [ :value | singleSelectionOptional := value ] ]
		output: singleSelectionOptional printString
		on: html