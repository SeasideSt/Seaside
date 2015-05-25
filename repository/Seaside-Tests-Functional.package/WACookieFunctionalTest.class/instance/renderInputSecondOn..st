rendering
renderInputSecondOn: html
	html tableRow: [
		self renderInputForCookie: #second on: html.
		html tableData: [
			html submitButton
				on: #addBoth of: self ] ]