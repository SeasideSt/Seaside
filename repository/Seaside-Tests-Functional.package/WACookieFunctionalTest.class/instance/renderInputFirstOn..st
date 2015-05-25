rendering
renderInputFirstOn: html
	html tableRow: [
		self renderInputForCookie: #first on: html.
		html tableData: [
			html submitButton
				on: #addFirst of: self ] ]