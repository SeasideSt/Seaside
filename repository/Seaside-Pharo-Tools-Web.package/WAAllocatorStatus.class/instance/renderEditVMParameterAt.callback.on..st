rendering
renderEditVMParameterAt: anInteger callback: aBlock on: html
	html space.
	html render: $[.
	html anchor
		title: 'edit';
		callback: aBlock;
		with: $e.
	html render: $]