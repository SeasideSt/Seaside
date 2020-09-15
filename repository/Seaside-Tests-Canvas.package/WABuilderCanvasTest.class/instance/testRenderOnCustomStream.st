tests
testRenderOnCustomStream
	| actual |
	actual := String streamContents: [ :stream |
		WAHtmlCanvas builder
			render: [ :html |
				html unorderedList: [
					html listItem: 'an item' ] ]
			on: stream ].
	self assert: actual = '<ul><li>an item</li></ul>'