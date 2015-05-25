rendering
renderCollectionFieldForAttribute: anAttribute on: html 
	self visitAttribute: anAttribute on: html.
	html tableData:  [
		html anchor
			onClick: 'return submitForm(this)';
			title: 'Configure collection attribute';
			callback: [ self configureCollectionAttribute: anAttribute ];
			with: 'Configure' ]