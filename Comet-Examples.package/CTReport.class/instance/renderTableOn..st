rendering
renderTableOn: html
	html tableRow: [
		html tableHeading: 'Name'.
		html tableHeading: 'Phone'.
		html tableHeading ].
	self items do: [ :each |
		html tableRow: [
			self renderRowView: each on: html ] ]