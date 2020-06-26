rendering
renderInputFirstOn: html
	html tableRow: [
		self renderInputForCookie: #first on: html.
		html tableData: [
			html submitButton
				id: #addFirstCookie;
				on: #addFirst of: self ] ]