rendering
renderButtonsOn: html
	html div class: 'dialog-buttons'; with: [
		self buttons do: [ :each |
			html  span
				class: 'dialog-button-', each;
				with: [ self renderButtonForSelector: each on: html ] ] ]