rendering
renderTableOn: canvas
	self
		renderInline: [ :html | html table: [ html tableRow: [ html tableData: 'data' ] ] ] 
		key: #table
		on: canvas