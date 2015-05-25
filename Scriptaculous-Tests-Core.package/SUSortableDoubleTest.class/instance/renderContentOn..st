rendering
renderContentOn: html
	html div
		style: 'float: left;';
		with: [ self renderList: #left titled: 'Left List' on: html ].
	html div
		style: 'float: left;';
		with: [ self renderList: #right titled: 'Right List' on: html ].
	html div
		style: 'clear: both'