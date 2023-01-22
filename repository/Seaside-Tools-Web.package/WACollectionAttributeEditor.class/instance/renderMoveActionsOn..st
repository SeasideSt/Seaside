rendering
renderMoveActionsOn: html
	self isWriteable 
		ifTrue: [	
			html anchor
				title: 'Add to list';
				onClick: 'return submitForm(this)';
				callback: [ self add ];
				with: [ html html: '&rarr;' ].
			html break; break. 
			html anchor
				title: 'Remove from list';
				onClick: 'return submitForm(this)';
				callback: [ self remove ];
				with: [ html html: '&larr;' ] ]
		ifFalse: [ html space: 5 ]