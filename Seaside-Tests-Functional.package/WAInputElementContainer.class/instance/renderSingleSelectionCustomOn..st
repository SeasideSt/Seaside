rendering-elements
renderSingleSelectionCustomOn: html 
	self 
		renderLabel: 'Single Selection (Custom)'
		input: [
			html select
				dispatchCallback;
				with: [
					self elements do: [ :each |
						html option
							label: 'Short: ', (each copyFrom: 1 to: 3);
							callback: [ singleSelectionCustom := each ];
							selected: (singleSelectionCustom = each);
							with: 'Custom:', each greaseString  ] ] ]
		output: singleSelectionCustom printString
		on: html