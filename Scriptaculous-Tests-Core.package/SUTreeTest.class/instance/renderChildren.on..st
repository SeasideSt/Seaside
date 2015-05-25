rendering
renderChildren: aCollection on: html
	aCollection do: [ :each |
		html listItem
			passenger: each;
			with: [ self renderNode: each on: html ] ]