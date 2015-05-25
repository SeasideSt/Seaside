rendering
renderMenuOn: html
	html div id: 'menu'; with: [
		html div class: 'left'.
		html unorderedList: [
			self menu do: [ :pair |
				html listItem: [
					html anchor
						url: pair first;
						with: pair last ] ] ].
		html div class: 'right' ]