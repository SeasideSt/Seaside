rendering
renderDateTimeSelectorsOn: html
	html heading level3; with: 'Dates and Times'.
	html form id: #dateTimeForm; with: [
		html table: [
			html tableRow
				class:'from';
				with:[ html tableData: 'From'; tableData: beginDAT ].
			html tableRow
				class:'to';
				with:[ html tableData: 'To'; tableData: endDAT ] ].
		html div: [
			html submitButton
				callback: [ self computeDuration ];
				text: 'Compute duration' ] ]