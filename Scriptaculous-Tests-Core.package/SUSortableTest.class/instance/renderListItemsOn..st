rendering
renderListItemsOn: html
	collection do: [ :each |
		html listItem
			passenger: each;
			with: each ]