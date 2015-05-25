rendering
renderLabel: aString input: anInputBlock output: anOutputBlock on: html
	html tableRow: [
		html tableHeading: aString.
		html tableData: anInputBlock.
		html tableData: anOutputBlock ]