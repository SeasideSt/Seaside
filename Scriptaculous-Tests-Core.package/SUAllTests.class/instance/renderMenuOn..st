rendering
renderMenuOn: html
	html unorderedList id: 'menu'; with: [
		tabs do: [ :each |
			html listItem: [
				html anchor
					class: (selected = each value
						ifTrue: [ 'active' ]);
					callback: [ selected := each value ];
					with: each key ] ] ]