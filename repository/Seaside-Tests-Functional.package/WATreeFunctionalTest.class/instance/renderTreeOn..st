rendering
renderTreeOn: html
	html strong: 'Selected:'.
	html span
		id:'selecteditem';
		with: selected.
	
	html render: tree