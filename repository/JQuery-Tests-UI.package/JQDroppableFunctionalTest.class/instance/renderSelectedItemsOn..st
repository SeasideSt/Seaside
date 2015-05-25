rendering
renderSelectedItemsOn: html
	self selected do: [ :each |
		html div 
			class: each; 
			passenger: each;
			script: (html jQuery new draggable
				onStop: (html jQuery this effect 
					percent: 1; puff; 
					onComplete: (html jQuery this parent load html: [ :r | 
						self selected remove: each ifAbsent: [ ].
						self renderSelectedItemsOn: r ]))) ]