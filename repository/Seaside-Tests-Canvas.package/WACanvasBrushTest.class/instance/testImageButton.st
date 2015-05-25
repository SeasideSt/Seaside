tests-tags-forms
testImageButton
	self
		assert: [ :html | html imageButton ]
		gives: '<input type="image" class="image"/>'