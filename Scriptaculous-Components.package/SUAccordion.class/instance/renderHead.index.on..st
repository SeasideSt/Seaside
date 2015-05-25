rendering
renderHead: anElement index: anInteger on: html
	html definitionTerm 
		id: (self uid: 'head' at: anInteger); 
		class: 'active' if: (self isVisible: anElement);
		with: [
			html anchor
				onClick: (html prototype evaluator
					callback: [ :script | self scriptToggle: anElement on: script ];
					return: false);
				callback: [ self toggle: anElement ];
				with: anElement label ]