rendering
renderInputSecondOn: html
	html tableRow: [
		self renderInputForCookie: #second on: html.
		html tableData: [
			html submitButton
				id: #addSecondCookie;
				on: #addBoth of: self ] ]