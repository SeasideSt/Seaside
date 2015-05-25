rendering
renderTabsOn: html 
	| active |
	html unorderedList
		class: 'head';
		with: [
			items keysAndValuesDo: [ :index :element | 
				active := self selected = element.
				html listItem: [
					html anchor
						id: (self uid: 'head' at: index);
						class: 'active' if: active;
						onClick: (html prototype evaluator
							callback: [ :script | self scriptSelected: element on: script ];
							return: false);
						callback: [ self selected: element ];
						with: element label ] ] ]