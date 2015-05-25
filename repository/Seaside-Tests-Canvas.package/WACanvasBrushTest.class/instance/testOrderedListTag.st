tests-tags
testOrderedListTag
	self
		assert: [ :html | html orderedList ]
		gives: '<ol></ol>'.
	self
		assert: [ :html | html orderedList add: 1 ]
		gives: '<ol><li>1</li></ol>'.
	self
		assert: [ :html | html orderedList addAll: #( 1 2 ) ]
		gives: '<ol><li>1</li><li>2</li></ol>'.
	self
		assert: [ :html | html orderedList list: #( 1 2 ) ]
		gives: '<ol><li>1</li><li>2</li></ol>'.
	self
		assert: [ :html | html orderedList list: #( 1 2 ); with: [ html listItem: 3 ] ]
		gives: '<ol><li>1</li><li>2</li><li>3</li></ol>'.
	self
		assert: [ :html | html orderedList add: 2; labels: [ :e | 2 * e ] ]
		gives: '<ol><li>4</li></ol>'.
	self
		assert: [ :html | html orderedList add: 2; labels: [ :e | 2 * e ]; with: [ html listItem: 5 ] ]
		gives: '<ol><li>4</li><li>5</li></ol>'