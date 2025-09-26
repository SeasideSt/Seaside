rendering
renderOn: html

	html
		text: 'Internal callback class: ';
		text: callback class name.
	callback ifNotNil: [
		html
			break;
			render: callback ]
