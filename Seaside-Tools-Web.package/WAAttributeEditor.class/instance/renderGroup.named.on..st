rendering
renderGroup: aBlock named: aName on: html
	html div class: 'group';
		 with: [
			html div
				class: 'groupTitle';
				with: [
					html label: aName.
					self renderActionsOn: html ].
			self collapsed 
				ifFalse: [
					self showHelp 
						ifTrue: [
							html div
								class: 'help';
								with: [
									html code: (self class helpTextFor: group) ] ]
						ifFalse: [
							html div
								class: 'groupContent';
								with: aBlock ] ] ]