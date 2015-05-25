rendering
renderBodyOn: html
	html div
		id: (self uid: 'body' at: 0);
		class: 'body';
		with: self selected