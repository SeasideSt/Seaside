rendering
renderMoveActionsOn: html
	self isWriteable 
		ifTrue: [	html anchor
			title: 'Add to list';
			onClick: 'return submitForm(this)';
			callback: [ self add ];
			with: '->'.
	html break; break. 
	html anchor
			title: 'Remove from list';
			onClick: 'return submitForm(this)';
			callback: [ self remove ];
			with: '<-'		]
		ifFalse: [ html space: 5 ]
