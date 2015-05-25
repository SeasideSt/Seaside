tests-tags-forms
testCheckboxTag
	self
		assert: [ :html | html checkbox ]
		gives: '<input type="checkbox"/>'.
	self
		assert: [ :html | html checkbox value: true ]
		gives: '<input checked="checked" type="checkbox"/>'.
	self
		assert: [ :html | html checkbox value: false; callback: [ :value | ] ]
		gives: '<input name="1" type="checkbox"/><input name="2" type="hidden"/>'.
	self
		assert: [ :html | html checkbox value: true; callback: [ :value | ] ]
		gives: '<input checked="checked" name="1" type="checkbox"/><input name="2" type="hidden"/>'