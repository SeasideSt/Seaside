rendering
renderLabel: aString value: anObject on: html
	html tableRow: [
		html tableHeading: aString.
		html tableData: anObject ]