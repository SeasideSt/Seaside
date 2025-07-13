basic tests
testOrderedList

	self
		assertMicroDown: '1. Item 1 
2. Item 2
3. Item 3'
		rendersTo: '<ol><li>Item 1</li><li>Item 2</li><li>Item 3</li></ol>'