rendering
renderContentOn: html
	html table
		cellspacing: 0;
		cellpadding: 0;
		style: 'width: 100%';
		with: [
			html tableRow: [
				html tableData
					verticalAlign: 'top';
					style: 'padding: 4px; width: 250px;';
					with: [ self renderDispatcherOn: html ].
				html tableData
					verticalAlign: 'top';
					style: 'padding: 4px';
					with: [ self renderEditorOn: html ] ] ]