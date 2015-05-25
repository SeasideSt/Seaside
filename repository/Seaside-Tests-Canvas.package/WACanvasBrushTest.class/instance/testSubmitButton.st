tests-tags-forms
testSubmitButton
	self
		assert: [ :html | html submitButton ]
		gives: '<input type="submit" class="submit"/>'.
	self
		assert: [ :html | html submitButton callback: [ ] ]
		gives: '<input name="1" type="submit" class="submit"/>'.
	self
		assert: [ :html | 
			self 
				should: [ html submitButton callback: [ :value | ] ]
				raise: Error ]
		gives: '<input type="submit" class="submit"/>'.
	self
		assert: [ :html | html submitButton on: #value of: self ]
		gives: '<input value="Value" name="1" type="submit" class="submit"/>'.
	self
		assert: [ :html | html submitButton: 'foo' ]
		gives: '<input value="foo" type="submit" class="submit"/>'.
	self
		assert: [ :html | html submitButton text: 'bar' ]
		gives: '<input value="bar" type="submit" class="submit"/>'.
	self
		assert: [ :html | html submitButton with: 'zork' ]
		gives: '<input value="zork" type="submit" class="submit"/>'