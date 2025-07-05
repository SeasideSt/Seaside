basic tests
testUnorderedList

	self
		assertMicroDown: '- Item 1 
- Item 2
- Item 3'
		rendersTo: '<ul><li>Item 1</li><li>Item 2</li><li>Item 3</li></ul>'