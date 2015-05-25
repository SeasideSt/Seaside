tests-tags-forms
testPasswordInput
	self
		assert: [ :html | html passwordInput ]
		gives: '<input type="password" class="password"/>'.
	self
		assert: [ :html | html passwordInput callback: [ :value | ] ]
		gives: '<input name="1" type="password" class="password"/>'.
	self
		assert: [ :html | html passwordInput: 'foo' ]
		gives: '<input value="foo" type="password" class="password"/>'.
	self
		assert: [ :html | html passwordInput value: 'bar' ]
		gives: '<input value="bar" type="password" class="password"/>'.
	self
		assert: [ :html | html passwordInput text: 'zork' ]
		gives: '<input value="zork" type="password" class="password"/>'.
	self
		assert: [ :html | html passwordInput callback: [ :value | ]; value: 'foo bar&zork' ]
		gives: '<input name="1" value="foo bar&amp;zork" type="password" class="password"/>'