rendering
renderActionsOn: html
	html span
		class: 'action';
		with: [
			self hasAdvancedAttributes ifTrue: [
				html anchor
					class: 'minus' if: self displayAdvancedAttributes;
					class: 'plus' if: self displayAdvancedAttributes not;
					title: (self displayAdvancedAttributes
						ifTrue: [ 'Hide advanced attributes' ]
						ifFalse: [ 'Show advanced attributes' ]);
					callback: [ self toggleAdvanced ].
				html space ].
			html anchor
				class: 'down' if: self collapsed;
				class: 'up' if: self collapsed not;
				title: (self collapsed
					ifTrue: [ 'Expand' ]
					 ifFalse: [ 'Collapse' ]);
				callback: [ self toggleVisbility ].
			(self class helpTextFor: group) isNil ifFalse: [
				html space.
				html anchor
					class: 'help';
					title: (self showHelp
						ifTrue: [ 'Hide Help' ]
						ifFalse: [ 'Show Help' ]);
					callback: [ self toggleHelp ] ] ]