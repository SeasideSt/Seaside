tests
testModifyingInsert
	self
		assert: (self element insert: 1)
		equals: '$(this).insert("1")'.
	self
		assert: (self element insertAfter: [ :r | r div ])
		equals: '$(this).insert({"after":"<div><\/div>"})'.
	self
		assert: (self element insertBefore: 'abc')
		equals: '$(this).insert({"before":"abc"})'.
	self
		assert: (self element insertTop: [ :r | r span: 5 ])
		equals: '$(this).insert({"top":"<span>5<\/span>"})'.
	self
		assert: (self element insertBottom: '5')
		equals: '$(this).insert({"bottom":"5"})'