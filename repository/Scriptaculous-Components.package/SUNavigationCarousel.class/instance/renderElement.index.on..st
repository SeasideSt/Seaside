rendering
renderElement: element index: index on: html 
	| currentId |
	currentId := self 
		uid: 'head'
		at: index.
	html div
		id: currentId;
		class: 'active'
			if: self selected = element;
		style: 'height:' , self elementHeight greaseString , 'px';
		with: 
			[ html anchor
				onClick: (html prototype evaluator
						callback: 
							[ :script | 
							self 
								scriptSelected: element
								id: currentId
								on: script ];
						return: false);
				callback: [ self selected: element ];
				with: [ html div: element label ] ]