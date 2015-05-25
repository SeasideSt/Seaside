tests-tags-forms
testCancelButton
	self
		assert: [ :html | html cancelButton ]
		gives: '<input type="submit"/>'.
	self
		assert: [ :html | html cancelButton callback: [ ] ]
		gives: '<input name="1" type="submit"/>'.
	self
		assert: [ :html | html cancelButton on: #value of: self ]
		gives: '<input value="Value" name="1" type="submit"/>'.
	self
		assert: [ :html | html cancelButton: 'foo' ]
		gives: '<input value="foo" type="submit"/>'.
	self
		assert: [ :html | html cancelButton text: 'bar' ]
		gives: '<input value="bar" type="submit"/>'.
	self
		assert: [ :html | html cancelButton with: 'zork' ]
		gives: '<input value="zork" type="submit"/>'