rendering
renderRequestHandlersOn: html
	html tableRow: [ 
		html tableHeading: 'Request Handlers:'.
		html tableData
			id: 'handlers';
			with: [ html orderedList list: self requestContext handlers ] ]