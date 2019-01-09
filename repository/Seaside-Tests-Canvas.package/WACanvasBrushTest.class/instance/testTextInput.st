tests-tags-forms
testTextInput
	self
		assert: [ :html | html textInput ]
		gives: '<input type="text"/>'.
	self
		assert: [ :html | html textInput callback: [ :value | ] ]
		gives: '<input name="1" type="text"/>'.
	self
		assert: [ :html | html textInput: 'foo' ]
		gives: '<input value="foo" type="text"/>'.
	self
		assert: [ :html | html textInput value: 'bar' ]
		gives: '<input value="bar" type="text"/>'.
	self
		assert: [ :html | html textInput text: 'zork' ]
		gives: '<input value="zork" type="text"/>'.
	self
		assert: [ :html | html textInput callback: [ :value | ]; value: 'foo bar&zork' ]
		gives: '<input name="1" value="foo bar&amp;zork" type="text"/>'