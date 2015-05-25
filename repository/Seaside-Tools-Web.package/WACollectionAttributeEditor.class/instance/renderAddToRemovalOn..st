rendering
renderAddToRemovalOn: html
	html anchor
		title: 'Add selected inherited elements to the removal list';
		onClick: 'return submitForm(this)';
		callback: [ self addToRemovals ];
		with: 'Remove inherited'.
	html space: 2.
	html anchor
		title: 'Remove selected elements from the removal list';
		onClick: 'return submitForm(this)';
		callback: [ self removeFromRemovals ];
		with: 'Undo Remove inherited'