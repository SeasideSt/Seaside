rendering
renderAnchorsOn: canvas
	self renderInline: [ :html | 
		html unorderedList: [
			html listItem: [
					html anchor
						name: 'name';
						callback: [ ];
						with: 'Anchor' ] ] ]
		factor: 1
		key: #anchor
		on: canvas
