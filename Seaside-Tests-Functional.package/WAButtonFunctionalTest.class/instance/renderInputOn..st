rendering
renderInputOn: html
	html table: [
		html tableRow: [
			html tableHeading: 'Value:'.
			html tableData: self input ].
		html tableRow: [
			html tableHeading: 'Input:'.
			html tableData: [
				html textInput
					on: #input of: self ] ] ]