rendering
renderTitleOn: html
	html table
		class: 'title';
		style: 'width:100%';
		cellspacing: 0;
		cellpadding:0;
		with: [
			html tableRow: [
				html tableData
					style: 'width:100%';
					class: 'label';
					with: title.
				html tableData: [ self renderMinimizeOn: html ] .
				html tableData: [ self renderCloseOn: html ] ] ] 
