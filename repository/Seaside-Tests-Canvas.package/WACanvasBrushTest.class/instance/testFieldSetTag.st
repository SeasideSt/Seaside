tests-tags
testFieldSetTag
	self
		assert: [ :html | html fieldSet: 'foo' ]
		gives: '<fieldset>foo</fieldset>'.
	self
		assert: [ :html | html fieldSet legend: 'bar'; with: 'zork' ]
		gives: '<fieldset><legend>bar</legend>zork</fieldset>'