rendering
renderWindowOn: html
	| id |
	html div
		id: (id := html nextId);
		script: (html jQuery new dialog
			title: 'Vegetables';
			autoOpen: false;
			addButton: 'Close' do: html jQuery new dialog close);
		with: [ html unorderedList list: self vegetables ].
	html submitButton
		onClick: (html jQuery id: id) dialog open;
		with: 'Open Window'.
	html submitButton
		onClick: (html jQuery id: id) dialog close;
		with: 'Close Window'