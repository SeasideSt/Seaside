rendering
renderRowView: anItem on: html
	html tableData: anItem name.
	html tableData: anItem phone.
	html tableData: [
		html anchor
			url: '#';
			" replace the owning row with an editable row "
			onClick: ((html jQuery this closest: 'tr') load
				html: [ :r | self renderRowEdit: anItem on: r ]);
			with: 'edit' ]