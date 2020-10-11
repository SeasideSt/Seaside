rendering
renderLabel: aString value: anObject on: html
	html tableRow
		id: aString;
		with: [ 
			html tableHeading: aString.
			html tableData: anObject ]