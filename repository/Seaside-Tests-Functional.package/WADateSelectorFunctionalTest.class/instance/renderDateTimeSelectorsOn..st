rendering
renderDateTimeSelectorsOn: html
	html heading level3; with: 'Dates and Times'.
	html form: [
		html table: [
			html tableRow: [
				html tableData: 'From'; tableData: beginDAT ].
			html tableRow: [
				html tableData: 'To'; tableData: endDAT ] ].
		html div: [
			html submitButton
				callback: [ self computeDuration ];
				text: 'Compute duration' ] ]