rendering
renderRowForSelector: aSymbol on: html
	html div
		id: 'dialog-row-' , aSymbol;
		class: 'dialog-row';
		with: [
			html span
				class: 'dialog-form-label';
				with: [ self renderLabelForSelector: aSymbol on: html ].
			html span
				class: 'dialog-form-field';
				with: [ self renderFieldForSelector: aSymbol on: html ] ]