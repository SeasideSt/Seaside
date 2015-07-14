rendering
renderMaximumSizeOn: html
	html tableRow: [
		html tableHeading: [
			html label: 'Maximum Size' ].
		html tableData: [ 
			html textInput
			size: 5;
			on: #maximumSize of: self ] ].
	html tableRow: [
		html tableData
			colSpan: 2;
			with: 'Number of sessions supported. When this limit is reached the overflow action is run. 0 for no maximum size. Has to be positive.' ]