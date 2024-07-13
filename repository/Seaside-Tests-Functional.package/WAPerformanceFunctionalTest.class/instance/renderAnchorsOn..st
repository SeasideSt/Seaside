rendering
renderAnchorsOn: canvas
	self renderInline: [ :html | 
		html unorderedList: [
			html listItem: [
					html anchor
						id: 'name';
						callback: [ ];
						with: 'Anchor' ] ] ]
		factor: 1
		key: #anchor
		on: canvas