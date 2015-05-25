rendering
renderMinimizeOn: html
	self minimizeButtonEnabled
		ifTrue: [
			html anchor
					title: 'Minimize';
					onClick: (html prototype evaluator
									callback: [ :script | 
												self collapseOn: script ];
												return: false);
					with: '-' ]