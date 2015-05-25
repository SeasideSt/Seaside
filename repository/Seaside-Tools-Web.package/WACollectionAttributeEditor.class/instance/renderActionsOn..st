rendering
renderActionsOn: html
	(self isOverride or: [ self isModify ])
		ifTrue: [
			html anchor
				title: 'Clear override';
				onClick: 'return submitForm(this)';
				callback: [ self clear ];
				with: 'Clear'.
			self isModify
				ifTrue: [ html space. self renderAddToRemovalOn: html ] ]
		ifFalse: [
			html anchor
				title: 'Override inherited values';
				onClick: 'return submitForm(this)';
				callback: [ self override ];
				with: 'Override'.
			html space.
			html anchor
				title: 'Define Additions and / or removals';
				onClick: 'return submitForm(this)';
				callback: [ self modify ];
				with: 'Modify' ]