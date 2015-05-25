rendering
renderUsernameOn: html
	html tableRow: [
		html tableData: [
			html label
				for: #userid;
				with: 'Username:' ].
		html tableData: [
			html textInput
				id: #userid;
				on: #user of: self ] ]