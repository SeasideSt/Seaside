tests
testBody
	| actual |
	actual := WAHtmlCanvas builder render: [ :html |
		html unorderedList: [
			html listItem: 'an item' ] ].
	self assert: actual = '<ul><li>an item</li></ul>'