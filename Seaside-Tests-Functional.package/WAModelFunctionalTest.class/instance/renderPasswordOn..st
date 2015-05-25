rendering
renderPasswordOn: html
	html tableRow: [
		html tableData: [
			html label
				for: #pass;
				with: 'Password:' ].
		html tableData: [
			html passwordInput
				id: #pass;
				on: #pass of: self ] ]