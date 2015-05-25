rendering
renderMoveUpAndDownOn: html
	(self isWriteable and: [ self currentList isEmpty not ]) ifTrue: [
		html anchor
			title: 'Move selected element up';
			onClick: 'return submitForm(this)';
			callback: [ self moveUp ];
			with: [ html html: '&uarr;' ].
			html break; break. 
			html anchor
				title: 'Move selected element down';
			onClick: 'return submitForm(this)';
			callback: [ self moveDown ];
			with: [ html html: '&darr;' ] ]