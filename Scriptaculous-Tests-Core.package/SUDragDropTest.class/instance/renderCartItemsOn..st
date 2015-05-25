rendering
renderCartItemsOn: html
	self cart isEmpty
		ifTrue: [ ^ html text: 'Drop items here to add them to your cart.' ].
	self cart valuesAndCounts associations sorted do: [ :each |
		html div
			class: 'cart-item';
			passenger: each key;
			script: (html scriptaculous draggable
				revert: true;
				ghosting: true);
			with: [
				html text: each key.
				each value > 1
					ifTrue: [ html text: ' ('; text: each value; text: ')' ] ] ]