tests-tags
testUnorderedListTag
	self
		assert: [ :html | html unorderedList ]
		gives: '<ul></ul>'.
	self
		assert: [ :html | html unorderedList add: 1 ]
		gives: '<ul><li>1</li></ul>'.
	self
		assert: [ :html | html unorderedList addAll: #( 1 2 ) ]
		gives: '<ul><li>1</li><li>2</li></ul>'.
	self
		assert: [ :html | html unorderedList list: #( 1 2 ) ]
		gives: '<ul><li>1</li><li>2</li></ul>'.
	self
		assert: [ :html | html unorderedList list: #( 1 2 ); with: [ html listItem: 3 ] ]
		gives: '<ul><li>1</li><li>2</li><li>3</li></ul>'.
	self
		assert: [ :html | html unorderedList add: 2; labels: [ :e | 2 * e ] ]
		gives: '<ul><li>4</li></ul>'.
	self
		assert: [ :html | html unorderedList add: 2; labels: [ :e | 2 * e ]; with: [ html listItem: 5 ] ]
		gives: '<ul><li>4</li><li>5</li></ul>'